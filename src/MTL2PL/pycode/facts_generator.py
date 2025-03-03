from SPARQLWrapper import SPARQLWrapper, JSON
import re
import pandas as pd
import json
import os
from tqdm import tqdm
from datetime import datetime

def query_entity(property_id, property_name, entities):
    sparql = SPARQLWrapper("https://query.wikidata.org/sparql")
    query = """
    SELECT DISTINCT ?entity ?entityLabel ?value ?valueLabel
        WHERE {
            ?entity wdt:%s ?value.
            ?entity wikibase:sitelinks ?sitelinks.
            FILTER (?sitelinks > 30).
            # FILTER (?value > "2000-01-01T00:00:00Z"^^xsd:dateTime)
            FILTER (?value >= "1400-01-01T00:00:00Z"^^xsd:dateTime && ?value < "2000-01-01T00:00:00Z"^^xsd:dateTime)
            FILTER (!REGEX(STR(?entity), "^[0-9]+$"))
            SERVICE wikibase:label { bd:serviceParam wikibase:language "en" . }
        }
    LIMIT 1000
    """ % property_id
    sparql.setQuery(query)
    sparql.setReturnFormat(JSON)
    sparql.setTimeout(15)
    try:
        results = sparql.query().convert()
        if len(results["results"]["bindings"]) == 0:
            return entities
        for result in results["results"]["bindings"]:
            print(result["entity"]["value"])
            entities.append({
                "entity": result["entity"]["value"],
                "entityLabel": result["entityLabel"]["value"]
            })
        return entities
    except Exception as e:
        with open(f'error_log.txt', 'a') as log_file:
            log_file.write(f"Error occurred while processing property '{property_name}': {str(e)}\n")
            print(f"Error occurred while processing property '{property_name}': {str(e)}")
        return []

def query_entity_2(property_id, property_name, entities):
    sparql = SPARQLWrapper("https://query.wikidata.org/sparql")
    query = """
    SELECT DISTINCT ?entity ?entityLabel ?value ?valueLabel
        WHERE {
            ?entity wdt:%s ?value.
            ?entity wikibase:sitelinks ?sitelinks.
            FILTER (?sitelinks > 30).
            FILTER (?value > "2000-01-01T00:00:00Z"^^xsd:dateTime)
            # FILTER (?value >= "1500-01-01T00:00:00Z"^^xsd:dateTime && ?value < "2000-01-01T00:00:00Z"^^xsd:dateTime)
            FILTER (!REGEX(STR(?entity), "^[0-9]+$"))
            SERVICE wikibase:label { bd:serviceParam wikibase:language "en" . }
        }
    LIMIT 1000
    """ % property_id
    sparql.setQuery(query)
    sparql.setReturnFormat(JSON)
    sparql.setTimeout(15)
    try:
        results = sparql.query().convert()
        if len(results["results"]["bindings"]) == 0:
            return entities
        for result in results["results"]["bindings"]:
            print(result["entity"]["value"])
            entities.append({
                "entity": result["entity"]["value"],
                "entityLabel": result["entityLabel"]["value"]
            })
        return entities
    except Exception as e:
        with open(f'error_log.txt', 'a') as log_file:
            log_file.write(f"Error occurred while processing property '{property_name}': {str(e)}\n")
            print(f"Error occurred while processing property '{property_name}': {str(e)}")
        return []

def parse_timestamp_to_dd_mm_yyyy(timestamp):
    # 解析时间戳字符串为 datetime 对象
    dt = datetime.fromisoformat(timestamp.replace("Z", "+00:00"))
    
    day = dt.day
    month = dt.month
    year = dt.year
    
    return [day, month, year]


def get_time_from_entity(entity_list, output_json_path):
    event_data = []
    for entity in tqdm(entity_list):
        time_list = []
        entity_id = entity["entity"].split("/")[-1]
        sparql = SPARQLWrapper("https://query.wikidata.org/sparql")
        query = """
        SELECT ?property ?value
        WHERE {
            wd:%s ?property ?value.
            FILTER (?property IN (wdt:P580, wdt:P582, wdt:P585)).
        }
        """ % entity_id
        sparql.setQuery(query)
        sparql.setReturnFormat(JSON)
        sparql.setTimeout(15)
        try:
            results = sparql.query().convert()
            if len(results["results"]["bindings"]) == 0:
                continue
            begin_time = None
            end_time = None
            for result in results["results"]["bindings"]:
                # print('start')
                # print(result["value"]["value"])
                property_id = result["property"]["value"].split("/")[-1]
                timestamp = result["value"]["value"]

                if property_id == "P580":
                    begin_time = parse_timestamp_to_dd_mm_yyyy(timestamp)
                elif property_id == "P582":
                    end_time = parse_timestamp_to_dd_mm_yyyy(timestamp)
                # if property_id == "P580":
                #     begin_time = parse_timestamp_to_dd_mm_yyyy(timestamp)
                # elif property_id == "P582":
                #     end_time = parse_timestamp_to_dd_mm_yyyy(timestamp)
                # elif property_id == "P585" and begin_time is None:
                #     begin_time = end_time = parse_timestamp_to_dd_mm_yyyy(timestamp)
            
            if begin_time and end_time:
                if entity["entityLabel"][0].isdigit() or entity["entityLabel"][0:1] == "\u":
                    entity["entityLabel"] = "ev_" + entity["entityLabel"]
                event_data.append({
                    "type": "begin",
                    "relation": entity["entityLabel"],
                    "dd": begin_time[0],
                    "mm": begin_time[1],
                    "year": begin_time[2]
                })

                event_data.append({
                    "type": "end",
                    "relation": entity["entityLabel"],
                    "dd": end_time[0],
                    "mm": end_time[1],
                    "year": end_time[2]
                })
        except Exception as e:
            with open(f'error_log.txt', 'a') as log_file:
                log_file.write(f"Error occurred while processing entity {entity_id}: {str(e)}\n")
                print(f"Error occurred while processing entity {entity_id}: {str(e)}")
    with open(output_json_path, 'w') as f:
        json.dump(event_data, f, indent=4)
    return event_data

def replace_special_characters(s):
    s = re.sub(r'[^a-zA-Z0-9]', '_', s)
    return s

property_id_list = ['P580']
property_name_list = ['start time']
entity_list = []
for property_id in property_id_list:
    property_name = property_name_list[property_id_list.index(property_id)]
    entity_list = query_entity(property_id, property_name, entity_list)
    entity_list = query_entity_2(property_id, property_name, entity_list)
# print(len(entity_list))
event_data = get_time_from_entity(entity_list, 'data/events.json')
backup_list = {}
for event in event_data:
    with open('data/facts.pl', 'a') as f:
        relation = replace_special_characters(event["relation"].lower())
        f.write(f'{event["type"]}(\'{relation}\', {event["dd"]}, {event["mm"]}, {event["year"]}).\n')
        backup_list[event["relation"]] = f'\'{relation}\''
with open('data/backup.json', 'w') as f:
    json.dump(backup_list, f, indent=4)
