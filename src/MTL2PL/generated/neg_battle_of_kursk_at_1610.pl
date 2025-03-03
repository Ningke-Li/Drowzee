:- include('database.pl').
battle_of_kursk(Start,End) :- begin('battle_of_kursk',_,_,Start), end('battle_of_kursk',_,_,End), Start=<End.

compare_battle_of_kursk(Dir,battle_of_kursk(Start1,_),battle_of_kursk(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_kursk([]).

generate_neg_battle_of_kursk([(Start,End) | Tail]) :- assert(neg_battle_of_kursk(Start,End)), generate_neg_battle_of_kursk(Tail).

sort_battle_of_kursk(SortedIntervals) :- findall((Start,End),battle_of_kursk(Start,End),UnsortedIntervals), predsort(compare_battle_of_kursk,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_kursk_aux() :- sort_battle_of_kursk(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_kursk(NegatedIntervals).

neg_battle_of_kursk_at_1610(Res) :- setof((Start,End),neg_battle_of_kursk(Start,End),AllINtervals), checkvalidity(1610,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_kursk_at_1610'), (neg_battle_of_kursk_at_1610(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_kursk_aux().

