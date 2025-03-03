from SPARQLWrapper import SPARQLWrapper, JSON
import re
import pandas as pd
import json
import os
from tqdm import tqdm

def get_entity_info(entity_id, entity_name):
    """ Get the related entities of the given entity """
    sparql = SPARQLWrapper("https://query.wikidata.org/sparql")
    query = """
    SELECT DISTINCT ?predicate ?predicateLabel ?object ?objectLabel ?anotherObject ?anotherObjectLabel WHERE {
        wd:%s ?predicate ?object .  # subject to object
        ?object ?predicate ?anotherObject .  # object to anotherObject
        FILTER(wd:%s != ?anotherObject)  
        SERVICE wikibase:label { 
            bd:serviceParam wikibase:language "en" .  
        }
    }
    LIMIT 100
    """ % (entity_id, entity_id)
    try:
        sparql.setQuery(query)
        sparql.setReturnFormat(JSON)
        sparql.setTimeout(60)
    
        results = sparql.query().convert()
        entities = []
        if len(results["results"]["bindings"]) == 0:
            return entities
        for result in results["results"]["bindings"]:
            if result["objectLabel"]["value"][0] == 'Q' or result["anotherObjectLabel"]["value"][0] == 'Q':
                continue
            if "Wiki" in result["objectLabel"]["value"] or "Wiki" in result["anotherObjectLabel"]["value"]:
                continue
            entities.append({
                "subject": entity_id,
                "subjectValue": entity_name,
                "predicate": result["predicate"]["value"].split('/')[-1],
                "predicateValue": result["predicateLabel"]["value"],
                "object": result["object"]["value"].split('/')[-1],
                "objectValue": result["objectLabel"]["value"],
                "anotherObject": result["anotherObject"]["value"].split('/')[-1],
                "anotherObjectValue": result["anotherObjectLabel"]["value"]
            })
        return entities
    except Exception as e:
        with open(f'error_log.txt', 'a') as log_file:
            log_file.write(f"Error occurred while processing entity '{entity_id}': {str(e)}\n")
            print(f"Error occurred while processing property '{entity_id}': {str(e)}")
        return []

def get_predicate_labels(predicate_set):
    """Get the labels of the predicates in the predicate set"""
    sparql = SPARQLWrapper("https://query.wikidata.org/sparql")
    
    predicates = ' '.join([f'wdt:{predicate}' for predicate in predicate_set])
    predicate_label_map = {}
    for predicate in predicate_set:
        query = """
        SELECT ?propertyLabel
            WHERE {
            wd:%s rdfs:label ?propertyLabel .
            FILTER(LANG(?propertyLabel) = "en")
            }
        """ % predicate
        
        sparql.setQuery(query)
        sparql.setReturnFormat(JSON)
        sparql.setTimeout(60)

        try:
            results = sparql.query().convert()

            for result in results["results"]["bindings"]:
                predicate_label = result["propertyLabel"]["value"]  
                predicate_label_map[predicate] = predicate_label

            
        except Exception as e:
            print(f"Error retrieving predicate labels: {str(e)}")
            return {}
    return predicate_label_map

def replace_predicates_with_labels(entities_list, predicate_label_map):
    """Replace predicate URIs with their labels in the entities list"""
    for entity in entities_list:
        predicate = entity["predicate"].split('/')[-1]
        if predicate in predicate_label_map:
            entity["predicateValue"] = predicate_label_map[predicate]
    return entities_list


if __name__ == "__main__":
    domain_list = ['culture', 'geography', 'health', 'history', 'mathematics', 'nature', 'people', 'society', 'technology']
    for domain in domain_list:
        with open(f'../wiki/{domain}_useful_entities.json', 'r') as f:
            data = json.load(f)
            
        class_list = []
        for item in data:
            class_list.append((item['entity'].split('/')[-1], item['entityLabel']))
        useful_list = []
        for entity_id, entity_name in class_list:
            useful_entities = get_entity_info(entity_id, entity_name)
            if len(useful_entities) == 0:
                continue
            if len(useful_list) > 500:
                break
            useful_list.extend(useful_entities)
        predicate_set = {entity["predicate"].split('/')[-1] for entity in data}
        predicate_label_map = get_predicate_labels(predicate_set)
        updated_entities_list = replace_predicates_with_labels(data, predicate_label_map)
        with open(f'../wiki/transitive/{domain}_useful_entities.json', 'w') as f:
            json.dump(updated_entities_list, f, indent=4)
