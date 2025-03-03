import time
import json
import concurrent.futures
import random
import os
import requests
from functools import partial


def local_model_query(input_prompt, temperature):
    while True:
        try:
            response = requests.post(
                "http://your_ip:11434/api/generate", 
                json={
                    "model": "llama3.1:8b-instruct-fp16",  # Adjust to your local model name if necessary
                    "prompt": input_prompt,
                    "stream": False
                }
            ).json()
            generated_content = response['response']
            print("result ", generated_content)
            break
        except:
            import traceback
            traceback.print_exc()
            print('error; waiting ten seconds and resubmitting')
            time.sleep(3)
    return generated_content

def run_single_evaluation(qa_pairs, temperature):
    question = qa_pairs["question"]
    input_prompt = f"""
        Now given the question: '{question}', please provide an answer with your knowledge and reasoning power. Think it step by step with a human-like reasoning process. After giving the answer, list the knowledge used in your reasoning process in the form of declarative sentences and point by point. The answer must contain 'Yes, ...' or 'No, ...' or 'I don't know.' at the beginning.
        Here is an example. Question: During Barack Obama took office of the president of USA, were any films directed by James Cameron released?
        Supposed Response: Yes, during Barack Obama's presidency from 2009 to 2017, one film directed by James Cameron was released - Avatar in 2009.
        The key knowledge points used in this reasoning process are:
        1. Barack Obama was the US President from January 20, 2009 to January 20, 2017.
        2. James Cameron is a famous film director known for movies like Titanic, Avatar, Terminator 2, etc.
        3. Cameron's only film release during Obama's presidency was Avatar in 2009. 
    """
    generated_content = local_model_query(input_prompt, temperature)
    qa_pairs["llm_answer"] = generated_content
    output_data.append(qa_pairs)

if __name__ == "__main__":
    MODEL_NAME = "llama3.1:8b-instruct-fp16"  # Local model name
    domain_list = ["culture", "geography", "health", "history", "mathematics", "nature", "people", "society", "technology"]
    rule_list = ["transitive", "inverse", "negation", "composite"]
    temperature_list = [0]
    for rule in rule_list:
        for domain in domain_list:
            output_data = []
            question_data = json.load(open(f'../../data_old/generated/selected/{rule}/{domain}/questions.json', 'r'))
            question_data = random.sample(question_data, 20)
            for temperature in temperature_list:
                # Multi-threading
                with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
                    # Use partial to pass temperature to the function
                    evaluation_function = partial(run_single_evaluation, temperature=temperature)
                    executor.map(evaluation_function, question_data)
                
                output_dir = f'../../res/{MODEL_NAME}/{temperature}/{rule}'
                if not os.path.exists(output_dir):
                    os.makedirs(output_dir)
                
                with open(f'{output_dir}/{domain}.json', 'w') as f:
                    json.dump(output_data, f, indent=4, ensure_ascii=False)
                
                print(f'{domain} {rule} done')
