import json
import os
import random
from tqdm import tqdm

dataset_format = {
    "qid": "",
    "category": "",
    "reasoning": "",
    "entityid": "",
    "entity": "",
    "description": "",
    "question": "",
    "answer": "",
    "evidence": []
}

def process_json_file(filepath, rule, domain, max_samples=200):
    dataset = []
    
    with open(filepath, 'r') as f:
        data = json.load(f)
    
    if len(data) < max_samples:
        print(f"File {filepath} contains less than {max_samples} samples, only {len(data)} samples, missing {max_samples - len(data)} samples")
    
    selected_data = random.sample(data, min(len(data), max_samples))
    
    for i, item in enumerate(selected_data):
        entry = {
            "category": domain,  
            "reasoning": rule,  
            "subject": item.get('subject', ""),
            "predicate": item.get('predicate', ""),
            "object": item.get('object', ""),
            "description": item.get('description', ""),
            "question": item.get('question', ""),
            "answer": item.get('ground_truth_answer', ""),
            "evidence": item.get('evidence', [])
        }
        dataset.append(entry)
    
    return dataset

def create_dataset(output_filepath, rules, domains, max_samples=40):
    dataset = []
    
    # 遍历规则和领域
    for rule in rules:
        for domain in domains:
            json_filepath = f"data/generated/{rule}/{domain}_new_facts.json"
            
            # 检查文件是否存在
            if os.path.exists(json_filepath):
                # 处理每个文件
                extracted_data = process_json_file(json_filepath, rule, domain, max_samples)
                dataset.extend(extracted_data)
            else:
                print(f"Fails to find file: {json_filepath}")
    
    with open(output_filepath, 'w') as f:
        json.dump(dataset, f, indent=4, ensure_ascii=False)

if __name__ == "__main__":
    rules = ["composite", "negation", "inverse", "transitive"]  
    domain_list = ["culture", "geography", "health", "history", "math", "nature", "people", "religion", "society", "tech"]

    create_dataset('datasets.json', rules, domain_list, max_samples=200)
