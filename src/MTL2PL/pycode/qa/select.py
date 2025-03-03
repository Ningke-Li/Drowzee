import json
import random
# with open('qa_original.json', 'r') as f:
#     qa_pairs = json.load(f)

# # 从res是true的里面选1000个，从res是false的里面选800个
# true_qa_pairs = []
# false_qa_pairs = []
# for qa in qa_pairs:
#     if qa["res"] == "true":
#         true_qa_pairs.append(qa)
#     else:
#         false_qa_pairs.append(qa)

# random.shuffle(true_qa_pairs)
# random.shuffle(false_qa_pairs)

# selected_qa_pairs = true_qa_pairs[:1000] + false_qa_pairs[:800]
# random.shuffle(selected_qa_pairs)

# with open('qa_selected.json', 'w') as f:
#     json.dump(selected_qa_pairs, f, indent=4, ensure_ascii=False)

# 读取qa_original 和 qa_selected
with open('qa_original.json', 'r') as f:
    qa_original = json.load(f)
with open('qa_selected.json', 'r') as f:
    qa_selected = json.load(f)

# 根据qa_selected的query，从qa_original中找到对应的question，替换qa_selected中的question
for qa in qa_selected:
    query = qa["query"]
    for qa_o in qa_original:
        if qa_o["query"] == query:
            qa["question"] = qa_o["question"]
            break

with open('qa_selected.json', 'w') as f:
    json.dump(qa_selected, f, indent=4, ensure_ascii=False)
    