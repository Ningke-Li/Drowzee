from SPARQLWrapper import SPARQLWrapper, JSON
import re
import pandas as pd
import json
import os
from tqdm import tqdm
from collections import defaultdict

def get_related_entity_list(entity_id, entity_name, prop_list):
    """Get the related entities of the given entity"""
    sparql = SPARQLWrapper("https://query.wikidata.org/sparql")
    query = """
    SELECT ?property ?propertyLabel ?value ?valueLabel WHERE {
        wd:%s ?p ?statement .
        ?statement ?ps ?value .
        ?property wikibase:claim ?p.
        ?property wikibase:statementProperty ?ps.
        SERVICE wikibase:label { bd:serviceParam wikibase:language "en". }
    }
    LIMIT 50
    """ % entity_id
    sparql.setQuery(query)
    sparql.setReturnFormat(JSON)
    sparql.setTimeout(30)
    try:
        results = sparql.query().convert()
        entities = []
        if len(results["results"]["bindings"]) == 0:
            return entities
        for result in results["results"]["bindings"]:
            prop = result["property"]["value"].split('/')[-1]
            if prop not in prop_list:
                continue
            entities.append({
                "entity": entity_id,
                "entityLabel": entity_name,
                "property": result["property"]["value"].split('/')[-1],
                "propertyLabel": result["propertyLabel"]["value"],
                "value": result["value"]["value"].split('/')[-1],
                "valueLabel": result["valueLabel"]["value"]
            })
        return entities
    except Exception as e:
        with open(f'error_log.txt', 'a') as log_file:
            log_file.write(f"Error occurred while processing entity '{entity_id}': {str(e)}\n")
            print(f"Error occurred while processing property '{entity_id}': {str(e)}")
        return []

def get_prop_list(xlsx_path):
    """Get the list of properties from the Excel file"""
    df = pd.read_excel(xlsx_path)
    prop_list = df['ID'].tolist()
    return prop_list

def replace_special_characters(s):
    """Replace special characters in the string"""
    s = re.sub(r'[^a-zA-Z0-9]', '_', s)
    return s

def save_to_pl_file(data, filename, backup_list):
    """Save the data to a Prolog file"""
    with open(filename, 'a') as file:
        for item in data:
            if item['propertyLabel'] == 'length':
                item['propertyLabel'] = 'the_length_of'
            # Assuming the data needs to be in the form of Prolog facts
            fact = "{}('{}', '{}').\n".format(
                replace_special_characters(item['propertyLabel'].lower()),
                replace_special_characters(item['entityLabel'].lower()),
                replace_special_characters(item['valueLabel'].lower())
            )
            file.write(fact)
            backup_list[item['propertyLabel']] = replace_special_characters(item['propertyLabel'])
            backup_list[item['entityLabel']] = replace_special_characters(item['entityLabel'])
            backup_list[item['valueLabel']] = replace_special_characters(item['valueLabel'])

def process_prolog_file(input_file, output_file):
    """Process the Prolog file to remove duplicates and sort the facts"""
    predicates = defaultdict(list)
    
    predicate_pattern = re.compile(r'^(\w+)\((.*)\)\.\s*$')

    with open(input_file, 'r') as file:
        lines = file.readlines()

    for line in lines:
        line = line.strip()
        if not line or line.startswith('%'):  
            continue
        match = predicate_pattern.match(line)
        if match:
            predicate_name = match.group(1)
            predicates[predicate_name].append(line)
        else:
            print(f"Skipping line: {line}")  

    with open(output_file, 'w') as file:
        for predicate, facts in predicates.items():
            for fact in facts:
                file.write(fact + '\n')

def main():
    prop_list = get_prop_list('../utils/wiki_property_cat_v1.xlsx')
    domain_list = ['geography', 'history', 'health', 'mathematics', 'nature', 'people', 'society', 'technology']
    output_folder = '../wiki/pl_files'
    for domain in domain_list:
        backup_list = {}
        log_entities = []
        wiki_entity_path = f'../wiki/{domain}_useful_entities.json'
        with open(wiki_entity_path, 'r') as file:
            entities = json.load(file)
        for entity in tqdm(entities):
            entity_id = entity['entity'].split('/')[-1]
            entity_name = entity['entityLabel']
            related_entities = get_related_entity_list(entity_id, entity_name, prop_list)
            output_file = os.path.join(output_folder, f'{domain}.pl')
            save_to_pl_file(related_entities, output_file, backup_list)
            for related_entity in related_entities:
                if related_entity not in log_entities:
                    log_entities.append(related_entity)
        process_prolog_file(output_file, output_file)
        with open(f'../wiki/backup/{domain}_backup_list.json', 'w') as file:
            json.dump(backup_list, file, indent=4)
        with open(f'../wiki/log/{domain}_log.json', 'w') as file:
            json.dump(log_entities, file, indent=4)
        

if __name__ == '__main__':
    main()