:- include('database.pl').
battle_of_shanghai(Start,End) :- begin('battle_of_shanghai',_,_,Start), end('battle_of_shanghai',_,_,End), Start=<End.

compare_battle_of_shanghai(Dir,battle_of_shanghai(Start1,_),battle_of_shanghai(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_shanghai([]).

generate_neg_battle_of_shanghai([(Start,End) | Tail]) :- assert(neg_battle_of_shanghai(Start,End)), generate_neg_battle_of_shanghai(Tail).

sort_battle_of_shanghai(SortedIntervals) :- findall((Start,End),battle_of_shanghai(Start,End),UnsortedIntervals), predsort(compare_battle_of_shanghai,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_shanghai_aux() :- sort_battle_of_shanghai(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_shanghai(NegatedIntervals).

neg_battle_of_shanghai_at_1375(Res) :- setof((Start,End),neg_battle_of_shanghai(Start,End),AllINtervals), checkvalidity(1375,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_shanghai_at_1375'), (neg_battle_of_shanghai_at_1375(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_shanghai_aux().

