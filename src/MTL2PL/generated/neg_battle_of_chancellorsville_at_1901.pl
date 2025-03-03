:- include('database.pl').
battle_of_chancellorsville(Start,End) :- begin('battle_of_chancellorsville',_,_,Start), end('battle_of_chancellorsville',_,_,End), Start=<End.

compare_battle_of_chancellorsville(Dir,battle_of_chancellorsville(Start1,_),battle_of_chancellorsville(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_chancellorsville([]).

generate_neg_battle_of_chancellorsville([(Start,End) | Tail]) :- assert(neg_battle_of_chancellorsville(Start,End)), generate_neg_battle_of_chancellorsville(Tail).

sort_battle_of_chancellorsville(SortedIntervals) :- findall((Start,End),battle_of_chancellorsville(Start,End),UnsortedIntervals), predsort(compare_battle_of_chancellorsville,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_chancellorsville_aux() :- sort_battle_of_chancellorsville(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_chancellorsville(NegatedIntervals).

neg_battle_of_chancellorsville_at_1901(Res) :- setof((Start,End),neg_battle_of_chancellorsville(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_chancellorsville_at_1901'), (neg_battle_of_chancellorsville_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_chancellorsville_aux().

