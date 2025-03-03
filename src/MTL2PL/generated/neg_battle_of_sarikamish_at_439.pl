:- include('database.pl').
battle_of_sarikamish(Start,End) :- begin('battle_of_sarikamish',_,_,Start), end('battle_of_sarikamish',_,_,End), Start=<End.

compare_battle_of_sarikamish(Dir,battle_of_sarikamish(Start1,_),battle_of_sarikamish(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_sarikamish([]).

generate_neg_battle_of_sarikamish([(Start,End) | Tail]) :- assert(neg_battle_of_sarikamish(Start,End)), generate_neg_battle_of_sarikamish(Tail).

sort_battle_of_sarikamish(SortedIntervals) :- findall((Start,End),battle_of_sarikamish(Start,End),UnsortedIntervals), predsort(compare_battle_of_sarikamish,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_sarikamish_aux() :- sort_battle_of_sarikamish(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_sarikamish(NegatedIntervals).

neg_battle_of_sarikamish_at_439(Res) :- setof((Start,End),neg_battle_of_sarikamish(Start,End),AllINtervals), checkvalidity(439,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_sarikamish_at_439'), (neg_battle_of_sarikamish_at_439(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_sarikamish_aux().

