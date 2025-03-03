import json
import os

def load_json(file_path):
    """
    加载JSON文件并返回数据列表。
    如果文件不存在或内容不是列表，返回空列表并打印错误信息。
    """
    if not os.path.exists(file_path):
        print(f"文件 {file_path} 不存在。")
        return []
    try:
        with open(file_path, 'r', encoding='utf-8') as file:
            data = json.load(file)
            if not isinstance(data, list):
                print(f"文件 {file_path} 的内容不是一个列表。")
                return []
            return data
    except json.JSONDecodeError as e:
        print(f"加载JSON文件时出错：{file_path}, 错误信息: {e}")
        return []
    except Exception as e:
        print(f"加载文件时出错：{file_path}, 错误信息: {e}")
        return []

def save_json(file_path, data):
    """
    将数据保存到指定的JSON文件中。
    如果目录不存在，自动创建。
    """
    os.makedirs(os.path.dirname(file_path), exist_ok=True)
    try:
        with open(file_path, 'w', encoding='utf-8') as file:
            json.dump(data, file, indent=4, ensure_ascii=False)
        print(f"数据已成功保存到 {file_path}")
    except Exception as e:
        print(f"保存文件时出错：{file_path}, 错误信息: {e}")
        