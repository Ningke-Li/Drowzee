:- include('database.pl').
battle_of_kiev(Start,End) :- begin('battle_of_kiev',_,_,Start), end('battle_of_kiev',_,_,End), Start=<End.

compare_battle_of_kiev(Dir,battle_of_kiev(Start1,_),battle_of_kiev(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_kiev([]).

generate_neg_battle_of_kiev([(Start,End) | Tail]) :- assert(neg_battle_of_kiev(Start,End)), generate_neg_battle_of_kiev(Tail).

sort_battle_of_kiev(SortedIntervals) :- findall((Start,End),battle_of_kiev(Start,End),UnsortedIntervals), predsort(compare_battle_of_kiev,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_kiev_aux() :- sort_battle_of_kiev(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_kiev(NegatedIntervals).

neg_battle_of_kiev_at_1067(Res) :- setof((Start,End),neg_battle_of_kiev(Start,End),AllINtervals), checkvalidity(1067,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_kiev_at_1067'), (neg_battle_of_kiev_at_1067(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_kiev_aux().

