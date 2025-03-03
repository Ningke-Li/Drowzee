:- include('database.pl').
battle_of_verdun(Start,End) :- begin('battle_of_verdun',_,_,Start), end('battle_of_verdun',_,_,End), Start=<End.

compare_battle_of_verdun(Dir,battle_of_verdun(Start1,_),battle_of_verdun(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_verdun([]).

generate_neg_battle_of_verdun([(Start,End) | Tail]) :- assert(neg_battle_of_verdun(Start,End)), generate_neg_battle_of_verdun(Tail).

sort_battle_of_verdun(SortedIntervals) :- findall((Start,End),battle_of_verdun(Start,End),UnsortedIntervals), predsort(compare_battle_of_verdun,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_verdun_aux() :- sort_battle_of_verdun(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_verdun(NegatedIntervals).

neg_battle_of_verdun_at_1553(Res) :- setof((Start,End),neg_battle_of_verdun(Start,End),AllINtervals), checkvalidity(1553,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_verdun_at_1553'), (neg_battle_of_verdun_at_1553(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_verdun_aux().

