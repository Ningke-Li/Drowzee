:- include('database.pl').
macedonian_front(Start,End) :- begin('macedonian_front',_,_,Start), end('macedonian_front',_,_,End), Start=<End.

compare_macedonian_front(Dir,macedonian_front(Start1,_),macedonian_front(Start2,_)) :- Start1=<Start2.

generate_neg_macedonian_front([]).

generate_neg_macedonian_front([(Start,End) | Tail]) :- assert(neg_macedonian_front(Start,End)), generate_neg_macedonian_front(Tail).

sort_macedonian_front(SortedIntervals) :- findall((Start,End),macedonian_front(Start,End),UnsortedIntervals), predsort(compare_macedonian_front,UnsortedIntervals,SortedIntervals).

generate_neg_macedonian_front_aux() :- sort_macedonian_front(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_macedonian_front(NegatedIntervals).

neg_macedonian_front_at_1783(Res) :- setof((Start,End),neg_macedonian_front(Start,End),AllINtervals), checkvalidity(1783,AllINtervals,Res).

check_query() :- write('Query = neg_macedonian_front_at_1783'), (neg_macedonian_front_at_1783(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_macedonian_front_aux().

