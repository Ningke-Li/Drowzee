:- include('database.pl').
battle_of_monte_cassino(Start,End) :- begin('battle_of_monte_cassino',_,_,Start), end('battle_of_monte_cassino',_,_,End), Start=<End.

compare_battle_of_monte_cassino(Dir,battle_of_monte_cassino(Start1,_),battle_of_monte_cassino(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_monte_cassino([]).

generate_neg_battle_of_monte_cassino([(Start,End) | Tail]) :- assert(neg_battle_of_monte_cassino(Start,End)), generate_neg_battle_of_monte_cassino(Tail).

sort_battle_of_monte_cassino(SortedIntervals) :- findall((Start,End),battle_of_monte_cassino(Start,End),UnsortedIntervals), predsort(compare_battle_of_monte_cassino,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_monte_cassino_aux() :- sort_battle_of_monte_cassino(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_monte_cassino(NegatedIntervals).

neg_battle_of_monte_cassino_at_1835(Res) :- setof((Start,End),neg_battle_of_monte_cassino(Start,End),AllINtervals), checkvalidity(1835,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_monte_cassino_at_1835'), (neg_battle_of_monte_cassino_at_1835(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_monte_cassino_aux().

