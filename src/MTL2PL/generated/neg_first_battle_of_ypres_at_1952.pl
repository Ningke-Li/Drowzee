:- include('database.pl').
first_battle_of_ypres(Start,End) :- begin('first_battle_of_ypres',_,_,Start), end('first_battle_of_ypres',_,_,End), Start=<End.

compare_first_battle_of_ypres(Dir,first_battle_of_ypres(Start1,_),first_battle_of_ypres(Start2,_)) :- Start1=<Start2.

generate_neg_first_battle_of_ypres([]).

generate_neg_first_battle_of_ypres([(Start,End) | Tail]) :- assert(neg_first_battle_of_ypres(Start,End)), generate_neg_first_battle_of_ypres(Tail).

sort_first_battle_of_ypres(SortedIntervals) :- findall((Start,End),first_battle_of_ypres(Start,End),UnsortedIntervals), predsort(compare_first_battle_of_ypres,UnsortedIntervals,SortedIntervals).

generate_neg_first_battle_of_ypres_aux() :- sort_first_battle_of_ypres(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_first_battle_of_ypres(NegatedIntervals).

neg_first_battle_of_ypres_at_1952(Res) :- setof((Start,End),neg_first_battle_of_ypres(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = neg_first_battle_of_ypres_at_1952'), (neg_first_battle_of_ypres_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_first_battle_of_ypres_aux().

