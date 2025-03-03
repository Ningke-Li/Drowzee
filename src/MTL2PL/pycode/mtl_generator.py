import json
import random
from typing import List, Tuple
import re
# 定义全局时间区间
GLOBAL_INTERVAL = (0, 2024)


def replace_special_characters(s):
    s = re.sub(r'[^a-zA-Z0-9]', '_', s)
    return s
# 定义MTL公式的类
class MTL:
    def get_true_interval(self) -> Tuple[int, int]:
        raise NotImplementedError

class Atom(MTL):
    def __init__(self, relation: str, begin_year: int, end_year: int):
        self.relation = relation
        self.begin_year = begin_year
        self.end_year = end_year

    def __repr__(self):
        return f"Atom({replace_special_characters(self.relation)})"

    def get_true_interval(self) -> Tuple[int, int]:
        return (self.begin_year, self.end_year)

# Finally 操作符
class Finally(MTL):
    def __init__(self, interval: Tuple[int, int], formula: MTL):
        self.interval = interval
        self.formula = formula

    def __repr__(self):
        return f"Finally[{self.interval}]({self.formula})"

    def get_true_interval(self) -> Tuple[int, int]:
        formula_interval = self.formula.get_true_interval()
        finally_start = formula_interval[0] - self.interval[1]
        finally_end = formula_interval[1] - self.interval[0]
        return (finally_start, finally_end)

# Globally 操作符
class Globally(MTL):
    def __init__(self, interval: Tuple[int, int], formula: MTL):
        self.interval = interval
        self.formula = formula

    def __repr__(self):
        return f"Globally[{self.interval}]({self.formula})"

    def get_true_interval(self) -> Tuple[int, int]:
        formula_interval = self.formula.get_true_interval()
        if self.interval[1] - self.interval[0] > formula_interval[1] - formula_interval[0]:
            return (0, 0)
        globally_start = formula_interval[0] - self.interval[0]
        globally_end = formula_interval[1] - self.interval[1]
        return (globally_start, globally_end)

# Next 操作符
class Next(MTL):
    def __init__(self, formula: MTL):
        self.formula = formula

    def __repr__(self):
        return f"Next({self.formula})"

    def get_true_interval(self) -> Tuple[int, int]:
        formula_interval = self.formula.get_true_interval()
        next_start = formula_interval[0] - 1
        next_end = formula_interval[1] - 1
        return (next_start, next_end)

# Neg类表示否定操作符
class Neg(MTL):
    def __init__(self, formulas: List[MTL]):
        self.formulas = formulas

    def __repr__(self):
        return f"Neg({self.formulas})"

    # 计算否定区间
    def get_true_interval(self) -> List[Tuple[int, int]]:
        # 获取所有公式的时间区间
        intervals = []
        for formula in self.formulas:
            # get_true_interval 必须返回元组（begin_year, end_year）
            intervals.append(formula.get_true_interval())

        # 确保 intervals 里面都是元组 (begin_year, end_year)
        sorted_intervals = sorted(intervals, key=lambda x: x[0])
        
        # 计算补集（否定区间）
        return self.compute_negated_intervals(0, sorted_intervals)

    def compute_negated_intervals(self, start: int, sorted_intervals: List[Tuple[int, int]]) -> List[Tuple[int, int]]:
        neg_intervals = []
        for (start_interval, end_interval) in sorted_intervals:
            if start < start_interval:
                neg_intervals.append((start, start_interval - 1))
            start = max(start, end_interval + 1)

        if start <= 2024:  # 假设 2024 为时间区间的上限
            neg_intervals.append((start, 2024))

        return neg_intervals

# Conj (AND) 操作符
class Conj(MTL):
    def __init__(self, formula1: MTL, formula2: MTL):
        self.formula1 = formula1
        self.formula2 = formula2

    def __repr__(self):
        return f"Conj({self.formula1}, {self.formula2})"

    # 获取两个公式的区间并取交集
    def get_true_interval(self) -> List[Tuple[int, int]]:
        intervals1 = self.formula1.get_true_interval()
        intervals2 = self.formula2.get_true_interval()

        # 确保 intervals1 和 intervals2 都是元组列表
        if not isinstance(intervals1, list):
            intervals1 = [intervals1]
        if not isinstance(intervals2, list):
            intervals2 = [intervals2]
        # print(f"Intervals1: {intervals1}, Intervals2: {intervals2}")  # 调试信息
        overlapping_intervals = self.overlap_two_lists(intervals1, intervals2)
        return overlapping_intervals

    # 计算两个区间列表的交集
    def overlap_two_lists(self, list1: List[Tuple[int, int]], list2: List[Tuple[int, int]]) -> List[Tuple[int, int]]:
        result = []
        for interval1 in list1:
            for interval2 in list2:
                # 确保 interval1 和 interval2 是元组
                if isinstance(interval1, tuple) and isinstance(interval2, tuple):
                    overlap_res = self.overlap_intervals(interval1, interval2)
                    if overlap_res:
                        result.append(overlap_res)
        return result

    # 计算两个区间的交集
    def overlap_intervals(self, interval1: Tuple[int, int], interval2: Tuple[int, int]) -> Tuple[int, int]:
        start1, end1 = interval1
        start2, end2 = interval2

        # 如果两个区间不重叠，返回空
        if start1 > end2 or start2 > end1:
            return None

        # 计算重叠的区间
        overlap_start = max(start1, start2)
        overlap_end = min(end1, end2)
        return (overlap_start, overlap_end)

# Disj (OR) 操作符类
class Disj(MTL):
    def __init__(self, formula1: MTL, formula2: MTL):
        self.formula1 = formula1
        self.formula2 = formula2

    def __repr__(self):
        return f"Disj({self.formula1}, {self.formula2})"

    def get_true_interval(self) -> List[Tuple[int, int]]:
        # 获取两个公式的时间区间
        interval1 = self.formula1.get_true_interval()
        interval2 = self.formula2.get_true_interval()
        
        # 合并两个区间
        intervals = [interval1, interval2]
        
        # 排序并合并区间
        return self.merge_intervals(intervals)
    
    def merge_intervals(self, intervals: List[Tuple[int, int]]) -> List[Tuple[int, int]]:
        # 按开始时间排序区间
        sorted_intervals = sorted(intervals, key=lambda x: x[0])
        
        # 合并重叠区间
        merged = []
        current_start, current_end = sorted_intervals[0]
        
        for start, end in sorted_intervals[1:]:
            if start <= current_end:
                # 有重叠，合并区间
                current_end = max(current_end, end)
            else:
                # 无重叠，保存当前区间，开始一个新的区间
                merged.append((current_start, current_end))
                current_start, current_end = start, end
        
        # 添加最后一个区间
        merged.append((current_start, current_end))
        
        return merged
        
# Imply (蕴含) 操作符：如果第一个公式为真，那么第二个公式也必须为真
class Imply(MTL):
    def __init__(self, left: MTL, right: MTL):
        self.left = left
        self.right = right

    def __repr__(self):
        return f"Imply({self.left}, {self.right})"

    def get_true_interval(self) -> List[Tuple[int, int]]:
        left_interval = self.left.get_true_interval()
        right_interval = self.right.get_true_interval()
        
        # 如果左公式的区间在右公式区间之外，直接返回整个全局区间，因为蕴含为真
        if left_interval[1] < right_interval[0] or right_interval[1] < left_interval[0]:
            return [GLOBAL_INTERVAL]  # 如果左边的公式为假，蕴含为真
        
        # 如果有交集，返回交集的区间
        imply_start = max(left_interval[0], right_interval[0])
        imply_end = min(left_interval[1], right_interval[1])
        
        return [(imply_start, imply_end)]


# Until 操作符
class Until(MTL):
    def __init__(self, interval: Tuple[int, int], event1: MTL, event2: MTL):
        self.interval = interval
        self.event1 = event1
        self.event2 = event2

    def __repr__(self):
        return f"Until[{self.interval}]({self.event1}, {self.event2})"

    def get_true_interval(self) -> Tuple[int, int]:
        # Until[a,b](ev1,ev2) -> true_interval
        # a -> []
        # 获取事件1和事件2的区间
        ev1_interval = self.event1.get_true_interval()
        ev2_interval = self.event2.get_true_interval()
        # print(f"ev1_interval: {ev1_interval}, ev2_interval: {ev2_interval}")
        a, b = self.interval
        
        # if ev1_interval[1] - ev1_interval[0] < a:
        #     return (0, 0)

        # 计算ev1的有效区间
        ev1_start = ev1_interval[0] + a
        ev1_end = ev1_interval[1] + 1  # 结束时间为ev1的结束时间

        # print(f"until ev1_start: {ev1_start}, ev1_end: {ev1_end}")
        # 计算ev2的有效区间
        ev2_start = ev2_interval[0]
        ev2_end = ev2_interval[1]

        # 计算重叠区间
        Start = max(ev1_start, ev2_start)
        End = min(ev1_end, ev2_end)

        # 确保Start小于End
        if Start < End:
            # 返回ev1的发生前的时间和ev2的发生后的时间
            return (max(Start - b, ev1_interval[0]), End - a)
        else:
            return (0, 0)  # 如果没有重叠，返回无效区间

# 从facts.json文件中读取事实
def load_facts(filename: str) -> List[Atom]:
    with open(filename, 'r', encoding='utf-8') as f:
        data = json.load(f)
    facts = []
    for fact in data:
        relation = fact['relation']
        if fact['type'] == 'begin':
            begin_year = fact['year']
            # 查找对应的end
            end_fact = next((f for f in data if f['relation'] == relation and f['type'] == 'end'), None)
            end_year = end_fact['year'] if end_fact else 2024  # 如果没有end，设置为2024
            facts.append(Atom(relation, begin_year, end_year))
    return facts

# 递归生成MTL公式，同时返回公式为真的区间
def generate_mtl_formula(atoms: List[Atom], operator_count: int = 1) -> Tuple[MTL, Tuple[int, int]]:
    if operator_count == 1:
        # 生成单个操作符的公式
        atom = random.choice(atoms)
        operator = random.choice(['Finally', 'Globally', 'Next', 'Neg'])

        if operator == 'Finally':
            interval = (random.randint(1, 10), random.randint(11, 20))
            formula = Finally(interval, atom)
            true_interval = formula.get_true_interval()
            return formula, true_interval

        elif operator == 'Globally':
            start, end = atom.get_true_interval()
            atom_interval = end - start
            if atom_interval < 2:
                return None, (0, 0)
            else:
                interval_length = random.randint(1, atom_interval-1)
                # print(f"atom_interval: {atom_interval}, interval_length: {interval_length}")
                interval_s = random.randint(1, atom_interval - interval_length)
                interval_e = interval_s + interval_length
            interval = (interval_s, interval_e)
            formula = Globally(interval, atom)
            true_interval = formula.get_true_interval()
            return formula, true_interval

        elif operator == 'Next':
            formula = Next(atom)
            true_interval = formula.get_true_interval()
            return formula, true_interval
        
        elif operator == 'Neg':
            formula = Neg([atom])
            true_interval = formula.get_true_interval()
            return formula, true_interval

    elif operator_count == 2:
        # 双操作符组合，举例：Finally(Globally(ap))
        atom = random.choice(atoms)
        start, end = atom.get_true_interval()
        atom_interval = end - start
        if atom_interval > 2:
            operator1 = random.choice(['Finally', 'Globally'])
            operator2 = random.choice(['Finally', 'Globally', 'Next', 'Neg'])
        else:
            return None, (0, 0)
        if operator1 == 'Finally' and operator2 == 'Globally':
            interval = (random.randint(1, 10), random.randint(11, 20))
            formula = Finally(interval, atom)
            inner_interval = formula.get_true_interval()
            atom_interval = inner_interval[1] - inner_interval[0]
            interval_length = random.randint(1, atom_interval-1)
            interval_s = random.randint(1, atom_interval - interval_length)
            interval_e = interval_s + interval_length
            interval = (interval_s, interval_e)
            nested_formula = Globally(interval, formula)
            true_interval = nested_formula.get_true_interval()
            return nested_formula, true_interval
            
        elif operator1 == 'Finally' and operator2 == 'Next':
            interval = (random.randint(1, 10), random.randint(11, 20))
            formula = Finally(interval, atom)
            inner_interval = formula.get_true_interval()
            nested_formula = Next(formula)
            true_interval = nested_formula.get_true_interval()
            return nested_formula, true_interval

        elif operator1 == 'Globally' and operator2 == 'Next':
            start, end = atom.get_true_interval()
            atom_interval = end - start
            interval_length = random.randint(1, atom_interval-1)
            interval_s = random.randint(1, atom_interval - interval_length)
            interval_e = interval_s + interval_length
            interval = (interval_s, interval_e)
            formula = Globally(interval, atom)
            inner_interval = formula.get_true_interval()
            nested_formula = Next(formula)
            true_interval = nested_formula.get_true_interval()
            return nested_formula, true_interval
        
        elif operator1 == 'Globally' and operator2 == 'Finally':
            start, end = atom.get_true_interval()
            atom_interval = end - start
            interval_length = random.randint(1, atom_interval-1)
            interval_s = random.randint(1, atom_interval - interval_length)
            interval_e = interval_s + interval_length
            interval = (interval_s, interval_e)
            formula = Globally(interval, atom)
            inner_interval = formula.get_true_interval()
            outer_interval = (random.randint(1, 10), random.randint(11, 20))
            nested_formula = Finally(outer_interval, formula)
            true_interval = nested_formula.get_true_interval()
            return nested_formula, true_interval
        
        elif operator1 == 'Finally' and operator2 == 'Neg':
            interval = (random.randint(1, 10), random.randint(11, 20))
            formula = Finally(interval, atom)
            nested_formula = Neg([formula])
            true_interval = nested_formula.get_true_interval()
            return nested_formula, true_interval
        
        elif operator1 == 'Globally' and operator2 == 'Neg':
            start, end = atom.get_true_interval()
            atom_interval = end - start
            interval_length = random.randint(1, atom_interval-1)
            interval_s = random.randint(1, atom_interval - interval_length)
            interval_e = interval_s + interval_length
            interval = (interval_s, interval_e)
            formula = Globally(interval, atom)
            nested_formula = Neg([formula])
            true_interval = nested_formula.get_true_interval()
            return nested_formula, true_interval
        else:
            return None, (0, 0)

    # 生成两个事件的公式（如 Conj、Disj、Imply）
    elif operator_count == 3:
        atom1 = random.choice(atoms)
        atom2 = random.choice(atoms)
        operator = random.choice(['Disj', 'Until', 'Conj'])
 
        if operator == 'Disj':
            formula = Disj(atom1, atom2)
            true_interval = formula.get_true_interval()
            return formula, true_interval

        else:
            overlapping_atoms = [
                (atom1, atom2) for atom1 in atoms for atom2 in atoms 
                if atom1 != atom2 and atom2.get_true_interval()[1] > atom1.get_true_interval()[0] 
                and atom2.get_true_interval()[0] < atom1.get_true_interval()[1] and atom1.get_true_interval()[1] != atom1.get_true_interval()[0] and atom2.get_true_interval()[1] != atom2.get_true_interval()[0]
            ]
            # print(overlapping_atoms)
            if overlapping_atoms and operator == 'Until':
                atom1, atom2 = random.choice(overlapping_atoms)
                # print(f"atom1: {atom1}, atom2: {atom2}")
                # 获取 atom1 和 atom2 的时间区间
                ev1_start, ev1_end = atom1.get_true_interval()
                ev2_start, ev2_end = atom2.get_true_interval()
                if ev1_start > ev2_start:
                    atom1, atom2 = atom2, atom1
                    ev1_start, ev1_end, ev2_start, ev2_end = ev2_start, ev2_end, ev1_start, ev1_end
                # print(f"ev1_start: {ev1_start}, ev1_end: {ev1_end}")
                # print(f"ev2_start: {ev2_start}, ev2_end: {ev2_end}")
                # 设置 a 和 b 的范围
                min_a = 1  # a 的最小值
                max_a = min(ev2_start - ev1_start - 1, ev1_end - ev1_start - 1)  # a 的最大值
                # print(f"min_a: {min_a}, max_a: {max_a}")
                if max_a > min_a:
                    a = random.randint(min_a, max_a)
                    b = random.randint(a + 1, a + 10)  # b 需要大于 a，并且不超过某个值

                    formula = Until((a, b), atom1, atom2)
                    true_interval = formula.get_true_interval()
                    return formula, true_interval
                else:
                    return None, (0, 0)
            
            if overlapping_atoms and operator == 'Conj':
                atom1, atom2 = random.choice(overlapping_atoms)
                formula = Conj(atom1, atom2)
                true_interval = formula.get_true_interval()
                return formula, true_interval


def write_formulas_to_txt(formula_list, filename, filename_with_res):
    """
    将生成的公式和对应的年份节点写入到txt文件，支持多个时间区间的情况
    :param formula_list: 生成的公式和区间元组列表 [(formula, interval), ...]
    :param filename: 输出的txt文件名
    """
    def get_random_year_from_intervals(intervals, true_count, false_count, target_ratio=0.5):
        """ 从多个区间中随机选择一个年份，同时控制 true 和 false 的比例 """
        valid_years = []
        for start, end in intervals:
            # 将范围从 (start-150) 到 (end+50) 的年份添加到 valid_years
            valid_years.extend([year for year in range(start - 150, end + 50) if year >= 0])

        # 如果目标比例还未达到，优先在有效区间内选择年份，增加 true 的概率
        if true_count / (true_count + false_count + 1e-5) < target_ratio:
            true_years = [year for year in valid_years if any(start <= year <= end for start, end in intervals)]
            if true_years:
                return random.choice(true_years)
        
        # 否则随机选择一个年份，可能会导致 false
        return random.choice(valid_years) if valid_years else None


    def fix_formula_brackets(formula_str):
        """ 修正公式中的括号，确保 Finally 和 Globally 的区间使用中括号，其他部分使用圆括号 """
        stack = []
        result = []
        i = 0

        while i < len(formula_str):
            if formula_str[i:i+2] == '[(':
                # 遇到 '[('，压入堆栈并加入到结果中，表示开始中括号区间
                stack.append('[')
                result.append('[')
                i += 2  # 跳过两个字符
            elif formula_str[i:i+2] == ')]':
                if stack and stack[-1] == '[':
                    # 匹配到 ')]'，弹出堆栈，结束中括号区间
                    stack.pop()
                    result.append(']')
                else:
                    # 否则保持原样
                    result.append(')')
                i += 2  # 跳过两个字符
            elif formula_str[i:i+2] == '([':
                # 遇到 '(['，压入堆栈并加入到结果中，表示开始圆括号区间
                stack.append('(')
                result.append('(')
                i += 2  # 跳过两个字符
            elif formula_str[i:i+2] == ')]':
                if stack and stack[-1] == '(':
                    # 匹配到 ')]'，弹出堆栈，结束圆括号区间
                    stack.pop()
                    result.append(')')
                else:
                    # 否则保持原样
                    result.append(']')
                i += 2  # 跳过两个字符
            else:
                # 其他字符保持原样
                result.append(formula_str[i])
                i += 1

        return ''.join(result)

    with open(filename, 'w') as file, open(filename_with_res, 'w') as file_with_res:
        true_count, false_count = 0, 0  # 记录true和false的计数
        for formula, interval in formula_list:
            # 如果是单个区间，统一成 [(start, end)] 形式
            if isinstance(interval, tuple):
                intervals = [interval]
            else:
                intervals = interval

            # 从区间中随机抽取一个年份节点
            year = get_random_year_from_intervals(intervals, true_count, false_count)
            
            # 判断 year 是否在 true_interval 中
            res = any(start <= year <= end for start, end in intervals)
            if res:
                true_count += 1
            else:
                false_count += 1

            fixed_formula = fix_formula_brackets(str(formula))
            fixed_formula = fixed_formula.replace(' ', '_')
            fixed_formula = fixed_formula.replace(',_', ', ')
            
                # 将公式和年份写入文件
            file.write(f"{fixed_formula}, {year};\n\n")
            file_with_res.write(f"{fixed_formula}, {year}, {res};\n\n")

if __name__ == "__main__":
    # 从facts.json中加载原子命题
    atoms = load_facts('data/events.json')
    output_file = 'data/queries.txt'
    formula_list = []
    for i in range(2000):
        # 生成单个操作符或两个操作符的MTL公式和对应的真值区间
        formula, true_interval = generate_mtl_formula(atoms, operator_count=1)
        if formula:
            formula_list.append((formula, true_interval))
        formula, true_interval = generate_mtl_formula(atoms, operator_count=2)
        if formula:
            formula_list.append((formula, true_interval))
        formula, true_interval = generate_mtl_formula(atoms, operator_count=3)
        if formula:
            formula_list.append((formula, true_interval))
        print(f"Generated {i+1} formulas: {formula}")
    write_formulas_to_txt(formula_list, output_file, 'data/queries_with_res.txt')
    
    