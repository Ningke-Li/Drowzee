:- include('database.pl').
one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

compare_one_tree_hill(Dir,one_tree_hill(Start1,_),one_tree_hill(Start2,_)) :- Start1=<Start2.

generate_neg_one_tree_hill([]).

generate_neg_one_tree_hill([(Start,End) | Tail]) :- assert(neg_one_tree_hill(Start,End)), generate_neg_one_tree_hill(Tail).

sort_one_tree_hill(SortedIntervals) :- findall((Start,End),one_tree_hill(Start,End),UnsortedIntervals), predsort(compare_one_tree_hill,UnsortedIntervals,SortedIntervals).

generate_neg_one_tree_hill_aux() :- sort_one_tree_hill(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_one_tree_hill(NegatedIntervals).

neg_one_tree_hill_at_649(Res) :- setof((Start,End),neg_one_tree_hill(Start,End),AllINtervals), checkvalidity(649,AllINtervals,Res).

check_query() :- write('Query = neg_one_tree_hill_at_649'), (neg_one_tree_hill_at_649(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_one_tree_hill_aux().

