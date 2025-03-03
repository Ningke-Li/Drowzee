:- include('database.pl').
battle_of_moscow(Start,End) :- begin('battle_of_moscow',_,_,Start), end('battle_of_moscow',_,_,End), Start=<End.

compare_battle_of_moscow(Dir,battle_of_moscow(Start1,_),battle_of_moscow(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_moscow([]).

generate_neg_battle_of_moscow([(Start,End) | Tail]) :- assert(neg_battle_of_moscow(Start,End)), generate_neg_battle_of_moscow(Tail).

sort_battle_of_moscow(SortedIntervals) :- findall((Start,End),battle_of_moscow(Start,End),UnsortedIntervals), predsort(compare_battle_of_moscow,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_moscow_aux() :- sort_battle_of_moscow(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_moscow(NegatedIntervals).

neg_battle_of_moscow_at_1109(Res) :- setof((Start,End),neg_battle_of_moscow(Start,End),AllINtervals), checkvalidity(1109,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_moscow_at_1109'), (neg_battle_of_moscow_at_1109(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_moscow_aux().

