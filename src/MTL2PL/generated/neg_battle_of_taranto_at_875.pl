:- include('database.pl').
battle_of_taranto(Start,End) :- begin('battle_of_taranto',_,_,Start), end('battle_of_taranto',_,_,End), Start=<End.

compare_battle_of_taranto(Dir,battle_of_taranto(Start1,_),battle_of_taranto(Start2,_)) :- Start1=<Start2.

generate_neg_battle_of_taranto([]).

generate_neg_battle_of_taranto([(Start,End) | Tail]) :- assert(neg_battle_of_taranto(Start,End)), generate_neg_battle_of_taranto(Tail).

sort_battle_of_taranto(SortedIntervals) :- findall((Start,End),battle_of_taranto(Start,End),UnsortedIntervals), predsort(compare_battle_of_taranto,UnsortedIntervals,SortedIntervals).

generate_neg_battle_of_taranto_aux() :- sort_battle_of_taranto(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_battle_of_taranto(NegatedIntervals).

neg_battle_of_taranto_at_875(Res) :- setof((Start,End),neg_battle_of_taranto(Start,End),AllINtervals), checkvalidity(875,AllINtervals,Res).

check_query() :- write('Query = neg_battle_of_taranto_at_875'), (neg_battle_of_taranto_at_875(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_battle_of_taranto_aux().

