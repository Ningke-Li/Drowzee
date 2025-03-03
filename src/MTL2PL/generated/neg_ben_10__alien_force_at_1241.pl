:- include('database.pl').
ben_10__alien_force(Start,End) :- begin('ben_10__alien_force',_,_,Start), end('ben_10__alien_force',_,_,End), Start=<End.

compare_ben_10__alien_force(Dir,ben_10__alien_force(Start1,_),ben_10__alien_force(Start2,_)) :- Start1=<Start2.

generate_neg_ben_10__alien_force([]).

generate_neg_ben_10__alien_force([(Start,End) | Tail]) :- assert(neg_ben_10__alien_force(Start,End)), generate_neg_ben_10__alien_force(Tail).

sort_ben_10__alien_force(SortedIntervals) :- findall((Start,End),ben_10__alien_force(Start,End),UnsortedIntervals), predsort(compare_ben_10__alien_force,UnsortedIntervals,SortedIntervals).

generate_neg_ben_10__alien_force_aux() :- sort_ben_10__alien_force(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ben_10__alien_force(NegatedIntervals).

neg_ben_10__alien_force_at_1241(Res) :- setof((Start,End),neg_ben_10__alien_force(Start,End),AllINtervals), checkvalidity(1241,AllINtervals,Res).

check_query() :- write('Query = neg_ben_10__alien_force_at_1241'), (neg_ben_10__alien_force_at_1241(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ben_10__alien_force_aux().

