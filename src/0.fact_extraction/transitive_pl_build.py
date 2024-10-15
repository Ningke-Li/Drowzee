from SPARQLWrapper import SPARQLWrapper, JSON
import re
import pandas as pd
import json
import os
from tqdm import tqdm
from collections import defaultdict


def replace_special_characters(s):
    s = re.sub(r'[^a-zA-Z0-9]', '_', s)
    return s

def save_to_pl_file(data, filename, backup_list):
    with open(filename, 'a') as file:
        if data['predicateValue'] == 'length':
            data['predicateValue'] = 'the_length_of'
        # Assuming the data needs to be in the form of Prolog facts
        fact = "{}('{}', '{}').\n".format(
            replace_special_characters(data['predicateValue'].lower()),
            replace_special_characters(data['subjectValue'].lower()),
            replace_special_characters(data['objectValue'].lower())
        )
        file.write(fact)
        fact = "{}('{}', '{}').\n".format(
            replace_special_characters(data['predicateValue'].lower()),
            replace_special_characters(data['objectValue'].lower()),
            replace_special_characters(data['anotherObjectValue'].lower())
        )
        file.write(fact)
        backup_list[data['predicateValue']] = replace_special_characters(data['predicateValue'])
        backup_list[data['subjectValue']] = replace_special_characters(data['subjectValue'])
        backup_list[data['objectValue']] = replace_special_characters(data['objectValue'])
        backup_list[data['anotherObjectValue']] = replace_special_characters(data['anotherObjectValue'])

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
    domain_list = ['geography', 'history', 'health', 'mathematics', 'nature', 'people', 'society', 'technology']
    output_folder = '../wiki/transitive/pl_files'
    for domain in domain_list:
        backup_list = {}
        log_entities = []
        wiki_entity_path = f'../wiki/transitive/{domain}_useful_entities.json'
        with open(wiki_entity_path, 'r') as file:
            entities = json.load(file)
        for entity in tqdm(entities):
            output_file = os.path.join(output_folder, f'{domain}.pl')
            save_to_pl_file(entity, output_file, backup_list)
            if entity not in log_entities:
                log_entities.append(entity)
        process_prolog_file(output_file, output_file)
        with open(f'../wiki/transitive/backup/{domain}_backup_list.json', 'w') as file:
            json.dump(backup_list, file, indent=4)
        with open(f'../wiki/transitive/log/{domain}_log.json', 'w') as file:
            json.dump(log_entities, file, indent=4)
        

if __name__ == '__main__':
    main()