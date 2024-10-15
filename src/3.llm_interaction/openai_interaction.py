import openai
import time
import json
import concurrent.futures
from openai import OpenAI
import random
import os
from functools import partial

def openai_query(input_prompt, temperature):
    client = OpenAI(
        api_key='your_api_key'
    )
    while True:
        try:
            result = client.chat.completions.create(
                model=MODEL_NAME,
                messages=[
                    {
                        "role": "system",
                        "content": f"Answer the question with your knowledge and reasoning power."}, 
                    {   
                        "role": "user", 
                        "content": input_prompt}
                    ], 
                temperature=temperature, 
                timeout=30,
                max_tokens=500)
            generated_content = result.choices[0].message.content
            print("result ", generated_content)
            break
        except:
            import traceback
            traceback.print_exc()
            print('error; waiting ten seconds and resubmitting')
            time.sleep(3)
    return generated_content


def openai_query_multi_run(input_prompt, temperature, multi_run=5):
    client = OpenAI(
        api_key='your_api_key'
    )
    generated_content_list = []
    for i in range(multi_run):
        while True:
            try:
                result = client.chat.completions.create(
                    model=MODEL_NAME,
                    messages=[
                        {
                            "role": "system",
                            "content": f"Answer the question with your knowledge and reasoning power."}, 
                        {   
                            "role": "user", 
                            "content": input_prompt}
                        ], 
                    temperature=temperature, 
                    timeout=30,
                    max_tokens=500)
                generated_content = result.choices[0].message.content
                generated_content_list.append(generated_content)
                # print("result ", generated_content)
                break
            except:
                import traceback
                traceback.print_exc()
                print('error; waiting ten seconds and resubmitting')
                time.sleep(3)
            
    return generated_content_list

def run_single_evaluation(qa_pairs, temperature):
    question = qa_pairs["question"]
    input_prompt = f"""
        Now given the question: '{question}', please provide an answer with your knowledge and reasoning power. Think it step by step with a human-like reasoning process. After giving the answer, list the knowledge used in your reasoning process in the form of declarative sentences and point by point. The answer must contains 'Yes, ...' or 'No, ...' or 'I don't know.' at the beginning.
        Here is an example. Question: During Barack Obama took office of the president of USA, were any films directed by James Cameron released?
        Supposed Response: Yes, during Barack Obama's presidency from 2009 to 2017, one film directed by James Cameron was released - Avatar in 2009.
        The key knowledge points used in this reasoning process are:
        1. Barack Obama was the US President from January 20, 2009 to January 20, 2017.
        2. James Cameron is a famous film director known for movies like Titanic, Avatar, Terminator 2, etc.
        3. Cameron's only film release during Obama's presidency was Avatar in 2009. 
    """
    generated_content = openai_query(input_prompt, temperature)
    qa_pairs["llm_answer"] = generated_content
    # generated_content_list = openai_query_multi_run(input_prompt, temperature)
    # qa_pairs["llm_answer"] = generated_content_list
    # print(generated_content_list)
    output_data.append(qa_pairs)


if __name__ = "__main__":
    MODEL_NAME = "gpt-3.5-turbo"
    model_name = "gpt-3.5-turbo"
    domain_list = ["culture", "geography", "health", "history", "mathematics", "nature", "people", "society", "technology"]
    rule_list = ["transitive", "inverse", "negation", "composite"]
    temperature_list = [0]
    for rule in rule_list:
        for domain in domain_list:
            output_data = []
            question_data = json.load(open(f'../../data_old/generated/selected/{rule}/{domain}/questions.json', 'r'))
            question_data = random.sample(question_data, 20)
            for temperature in temperature_list:
                # Multi-thread
                with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
                    # Use partial to pass temperature to the function
                    evaluation_function = partial(run_single_evaluation, temperature=temperature)
                    executor.map(evaluation_function, question_data)
                # # Single thread
                # for idx, qa_pairs in enumerate(question_data):
                #     run_single_evaluation(qa_pairs)
                if not os.path.exists(f'../../res/{model_name}/{temperature}/{rule}'):
                    os.makedirs(f'../../res/{model_name}/{temperature}/{rule}')
                with open(f'../../res/{model_name}/{temperature}/{rule}/{domain}.json', 'w') as f:
                    json.dump(output_data, f, indent=4, ensure_ascii=False)
                print(f'{domain} {rule} done')