import json
from vllm import LLM, SamplingParams
import concurrent.futures

def vllm_query(llm, input_prompt):
    # Generate texts from the prompts. The output is a list of RequestOutput objects
    # that contain the prompt, generated text, and other information.
    outputs = llm.generate(input_prompt, sampling_params)

    # Print the outputs.
    for output in outputs:
        prompt = output.prompt
        generated_text = output.outputs[0].text
        print(f"Prompt: {prompt!r}, Generated text: {generated_text!r}")
    return generated_text

def run_single_evaluation(qa_pairs):
    description = qa_pairs["description"]
    question = qa_pairs["question"]
    input_prompt = f"""
        Now given the question: '{question}', please provide an answer with ONLY Yes/No and show your reasoning process in the answer.
        The answer format must be: Yes, because .../No, because ... Other format of answers are strictly forbidden.
        NEVER answer with 'I don't know' or 'As an AI, I don't...' and so on.
    """
    # print(input_prompt)
    generated_content = vllm_query(llm, input_prompt)
    qa_pairs["llm_answer"] = generated_content
    output_data.append(qa_pairs)

def model_evaluation(model_name):
    collection_list = ["culture", "geography", "health", "history", "mathematics", "nature", "people", "society", "technology"]

    # Create a sampling params object.
    sampling_params = SamplingParams(temperature=0, max_tokens=500)

    # Create an LLM.
    llm = LLM(model=model_name,
                gpu_memory_utilization = 0.5
                )
    for collection in collection_list:
        output_data = []
        question_data = json.load(open(f'../data/categorized/{collection}_dataset.json', 'r'))
        
        # with concurrent.futures.ThreadPoolExecutor(max_workers=5) as executor:
        #     executor.map(run_single_evaluation, question_data)

        for qa_pairs in question_data:
            run_single_evaluation(qa_pairs)
        with open(f'../res/{model_name}/{collection}.json', 'w') as f:
            json.dump(output_data, f, indent=4, ensure_ascii=False)

if __name__ == '__main__':
    model_name_list = ['meta-llama/Llama-2-7b-chat-hf', 'meta-llama/Llama-2-13b-chat-hf', 'lmsys/vicuna-13b-v1.5', 'mistralai/Mistral-7B-Instruct-v0.1']
    for model_name in model_name_list:
        model_evaluation(model_name)