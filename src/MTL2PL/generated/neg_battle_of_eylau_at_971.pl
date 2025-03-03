:- include('database.pl').
battle_of_eylau(Start,End) :- begin('battle_of_eylau',_,_,Start), end('battle_of_eylau',_,_,End), Start=<End.

compare_battle_of_eylau(Dir,battle_of_eylau(Start1,_),battle_of_eylau(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_eylau([]).

generate_neg_battle_of_eylau([(Start,End) | Tail]) :- assert(neg_battle_of_eylau(Start,End)), generate_neg_battle_of_eylau(Tail).

sort_battle_of_eylau(SortedIntervals) :- findall((Start,End),battle_of_eylau(Start,End),UnsortedIntervals), predsort(compare_battle_of_eylau,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_eylau_aux() :- sort_battle_of_eylau(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_eylau(NegatedIntervals).

neg_battle_of_eylau_at_971(Res) :- setof((Start,End),neg_battle_of_eylau(Start,End),AllINtervals), checkvalidity(971,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_eylau_at_971'), (neg_battle_of_eylau_at_971(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_eylau_aux().

