:- include('database.pl').
battle_of_the_somme(Start,End) :- begin('battle_of_the_somme',_,_,Start), end('battle_of_the_somme',_,_,End), Start=<End.

compare_battle_of_the_somme(Dir,battle_of_the_somme(Start1,_),battle_of_the_somme(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_the_somme([]).

generate_neg_battle_of_the_somme([(Start,End) | Tail]) :- assert(neg_battle_of_the_somme(Start,End)), generate_neg_battle_of_the_somme(Tail).

sort_battle_of_the_somme(SortedIntervals) :- findall((Start,End),battle_of_the_somme(Start,End),UnsortedIntervals), predsort(compare_battle_of_the_somme,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_the_somme_aux() :- sort_battle_of_the_somme(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_the_somme(NegatedIntervals).

neg_battle_of_the_somme_at_1456(Res) :- setof((Start,End),neg_battle_of_the_somme(Start,End),AllINtervals), checkvalidity(1456,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_the_somme_at_1456'), (neg_battle_of_the_somme_at_1456(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_the_somme_aux().

