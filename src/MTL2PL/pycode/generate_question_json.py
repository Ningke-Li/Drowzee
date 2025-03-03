import json

def load_replacements(backup_file_path):
    with open(backup_file_path, 'r', encoding='utf-8') as f:
        replacements = json.load(f)
    # 将备份文件的键值对反转，用于替换
    reverse_replacements = {v.strip("'"): k for k, v in replacements.items()}
    return reverse_replacements

def replace_names(question, replacements):
    words = question.split()  # 按空格分割
    updated_words = []

    for word in words:
        # 只处理带下划线的单词
        if '_' in word:
            original_name = replacements.get(word.lower())
            if original_name and original_name[0:3] == 'ev_':
                original_name = original_name[3:]  # 去掉 'ev_' 前缀
            updated_words.append(original_name if original_name else word)
        else:
            updated_words.append(word)
    
    return ' '.join(updated_words)  # 重新拼接成一句话

def parse_txt_to_json(file_path, backup_file_path):
    replacements = load_replacements(backup_file_path)  # 加载替换词典
    items = []
    with open(file_path, 'r', encoding='utf-8') as f:
        content = f.read().strip().split('\n\n')  # 以双换行分隔每个item

        for item in content:
            lines = item.strip().split('\n')
            if len(lines) >= 3:
                question = lines[0]
                question = replace_names(question, replacements)  # 替换名称

                query = lines[1].split('= ')[1].strip()
                res = lines[2].split('= ')[1].strip()

                items.append({
                    "question": question,
                    "query": query,
                    "res": res
                })

    # 将数据写入JSON文件
    with open('qa/qa_original.json', 'w', encoding='utf-8') as json_file:
        json.dump(items, json_file, indent=4, ensure_ascii=False)

parse_txt_to_json('../MTL2PL/output.txt', 'data/backup.json')
