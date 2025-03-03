:- include('database.pl').
battle_of_peleliu(Start,End) :- begin('battle_of_peleliu',_,_,Start), end('battle_of_peleliu',_,_,End), Start=<End.

compare_battle_of_peleliu(Dir,battle_of_peleliu(Start1,_),battle_of_peleliu(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_peleliu([]).

generate_neg_battle_of_peleliu([(Start,End) | Tail]) :- assert(neg_battle_of_peleliu(Start,End)), generate_neg_battle_of_peleliu(Tail).

sort_battle_of_peleliu(SortedIntervals) :- findall((Start,End),battle_of_peleliu(Start,End),UnsortedIntervals), predsort(compare_battle_of_peleliu,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_peleliu_aux() :- sort_battle_of_peleliu(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_peleliu(NegatedIntervals).

neg_battle_of_peleliu_at_1151(Res) :- setof((Start,End),neg_battle_of_peleliu(Start,End),AllINtervals), checkvalidity(1151,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_peleliu_at_1151'), (neg_battle_of_peleliu_at_1151(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_peleliu_aux().

