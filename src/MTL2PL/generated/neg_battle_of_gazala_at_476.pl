:- include('database.pl').
battle_of_gazala(Start,End) :- begin('battle_of_gazala',_,_,Start), end('battle_of_gazala',_,_,End), Start=<End.

compare_battle_of_gazala(Dir,battle_of_gazala(Start1,_),battle_of_gazala(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_gazala([]).

generate_neg_battle_of_gazala([(Start,End) | Tail]) :- assert(neg_battle_of_gazala(Start,End)), generate_neg_battle_of_gazala(Tail).

sort_battle_of_gazala(SortedIntervals) :- findall((Start,End),battle_of_gazala(Start,End),UnsortedIntervals), predsort(compare_battle_of_gazala,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_gazala_aux() :- sort_battle_of_gazala(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_gazala(NegatedIntervals).

neg_battle_of_gazala_at_476(Res) :- setof((Start,End),neg_battle_of_gazala(Start,End),AllINtervals), checkvalidity(476,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_gazala_at_476'), (neg_battle_of_gazala_at_476(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_gazala_aux().

