
import requests
import json
from sentence_transformers import SentenceTransformer, util
import re

def openie_extract_triples(text):
    url = 'http://localhost:8000'
    params = {
        'properties': '{"annotators": "openie", "outputFormat": "json"}',
        'pipelineLanguage': 'en'
    }
    response = requests.post(url, params=params, data=text.encode('utf-8'))
    response.raise_for_status()
    results = response.json()
    
    triples = []
    for sentence in results['sentences']:
        for triple in sentence['openie']:
            triples.append({
                'subject': triple['subject'],
                'relation': triple['relation'],
                'object': triple['object']
            })
    return triples

def compare_text_similarity(text1, text2):
    model = SentenceTransformer('sentence-transformers/all-MiniLM-L6-v2')
    embeddings = model.encode([text1, text2])
    cosine_similarity = util.pytorch_cos_sim(embeddings[0], embeddings[1])
    
    return cosine_similarity.item()

def filter_reponse_text(response_text):
    key_points = re.split(r'\n\d+\.\s+', response_text)
    key_points = [point.strip() for point in key_points if point.strip()]
    return key_points

if __name__ == '__main__':
    model_list = ["llama2-70b", "llama2-7b", "mixtral8x7b", "gpt-4", "gpt-3.5-turbo", "mistral-7b"]
    domain_list = ["culture", "geography", "health", "history", "mathematics", "nature", "people", "society", "technology"]
    rule_list = ["transitive", "symmetric", "negation", "composite"]
    for domain in domain_list:
        for model in model_list:
            for rule in rule_list:
                res_file = f"../../res/{model}/{rule}/{domain}.json"
                res_data = json.load(open(res_file, 'r'))
                for idx, qa_pairs in enumerate(res_data):
                    question = qa_pairs["question"]
                    ground_truth_triples = qa_pairs["triples"]
                    response = qa_pairs["llm_answer"]
                    key_points = filter_reponse_text(response)
                    for key_point in key_points:
                        triples = openie_extract_triples(key_point)
                        for triple in triples:
                            for gt_truth in ground_truth_triples:
                                subject_similarity = compare_text_similarity(gt_truth['subject'], triple['subject'])
                                predicate_similarity = compare_text_similarity(gt_truth['predicate'], triple['predicate'])
                                object_similarity = compare_text_similarity(gt_truth['object'], triple['object'])
                                if subject_similarity > 0.8 and predicate_similarity > 0.8 and object_similarity > 0.8:
                                    break
                                else:
                                    qa_pairs["similarity"] = {
                                        "subject_similarity": subject_similarity,
                                        "predicate_similarity": predicate_similarity,
                                        "object_similarity": object_similarity
                                    }
                new_res_file = f"../../res/{model}/{rule}/{domain}_similarity.json"
                with open(new_res_file, 'w') as f:
                    json.dump(res_data, f, indent=4)
                                