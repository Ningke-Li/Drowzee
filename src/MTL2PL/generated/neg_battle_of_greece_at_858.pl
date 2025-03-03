:- include('database.pl').
battle_of_greece(Start,End) :- begin('battle_of_greece',_,_,Start), end('battle_of_greece',_,_,End), Start=<End.

compare_battle_of_greece(Dir,battle_of_greece(Start1,_),battle_of_greece(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_greece([]).

generate_neg_battle_of_greece([(Start,End) | Tail]) :- assert(neg_battle_of_greece(Start,End)), generate_neg_battle_of_greece(Tail).

sort_battle_of_greece(SortedIntervals) :- findall((Start,End),battle_of_greece(Start,End),UnsortedIntervals), predsort(compare_battle_of_greece,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_greece_aux() :- sort_battle_of_greece(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_greece(NegatedIntervals).

neg_battle_of_greece_at_858(Res) :- setof((Start,End),neg_battle_of_greece(Start,End),AllINtervals), checkvalidity(858,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_greece_at_858'), (neg_battle_of_greece_at_858(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_greece_aux().

