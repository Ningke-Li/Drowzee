:- include('database.pl').
operation_pillar_of_defense(Start,End) :- begin('operation_pillar_of_defense',_,_,Start), end('operation_pillar_of_defense',_,_,End), Start=<End.

compare_operation_pillar_of_defense(Dir,operation_pillar_of_defense(Start1,_),operation_pillar_of_defense(Start2,_)) :- Start1=<Start2.

generate_neg_operation_pillar_of_defense([]).

generate_neg_operation_pillar_of_defense([(Start,End) | Tail]) :- assert(neg_operation_pillar_of_defense(Start,End)), generate_neg_operation_pillar_of_defense(Tail).

sort_operation_pillar_of_defense(SortedIntervals) :- findall((Start,End),operation_pillar_of_defense(Start,End),UnsortedIntervals), predsort(compare_operation_pillar_of_defense,UnsortedIntervals,SortedIntervals).

generate_neg_operation_pillar_of_defense_aux() :- sort_operation_pillar_of_defense(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_operation_pillar_of_defense(NegatedIntervals).

neg_operation_pillar_of_defense_at_1976(Res) :- setof((Start,End),neg_operation_pillar_of_defense(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = neg_operation_pillar_of_defense_at_1976'), (neg_operation_pillar_of_defense_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_operation_pillar_of_defense_aux().

