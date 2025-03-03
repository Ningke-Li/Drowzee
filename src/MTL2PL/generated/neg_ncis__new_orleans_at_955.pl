:- include('database.pl').
ncis__new_orleans(Start,End) :- begin('ncis__new_orleans',_,_,Start), end('ncis__new_orleans',_,_,End), Start=<End.

compare_ncis__new_orleans(Dir,ncis__new_orleans(Start1,_),ncis__new_orleans(Start2,_)) :- Start1=<Start2.

generate_neg_ncis__new_orleans([]).

generate_neg_ncis__new_orleans([(Start,End) | Tail]) :- assert(neg_ncis__new_orleans(Start,End)), generate_neg_ncis__new_orleans(Tail).

sort_ncis__new_orleans(SortedIntervals) :- findall((Start,End),ncis__new_orleans(Start,End),UnsortedIntervals), predsort(compare_ncis__new_orleans,UnsortedIntervals,SortedIntervals).

generate_neg_ncis__new_orleans_aux() :- sort_ncis__new_orleans(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ncis__new_orleans(NegatedIntervals).

neg_ncis__new_orleans_at_955(Res) :- setof((Start,End),neg_ncis__new_orleans(Start,End),AllINtervals), checkvalidity(955,AllINtervals,Res).

check_query() :- write('Query = neg_ncis__new_orleans_at_955'), (neg_ncis__new_orleans_at_955(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ncis__new_orleans_aux().

