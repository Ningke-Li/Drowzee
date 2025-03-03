:- include('database.pl').
jessie(Start,End) :- begin('jessie',_,_,Start), end('jessie',_,_,End), Start=<End.

compare_jessie(Dir,jessie(Start1,_),jessie(Start2,_)) :- Start1=<Start2.

generate_neg_jessie([]).

generate_neg_jessie([(Start,End) | Tail]) :- assert(neg_jessie(Start,End)), generate_neg_jessie(Tail).

sort_jessie(SortedIntervals) :- findall((Start,End),jessie(Start,End),UnsortedIntervals), predsort(compare_jessie,UnsortedIntervals,SortedIntervals).

generate_neg_jessie_aux() :- sort_jessie(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_jessie(NegatedIntervals).

neg_jessie_at_448(Res) :- setof((Start,End),neg_jessie(Start,End),AllINtervals), checkvalidity(448,AllINtervals,Res).

check_query() :- write('Query = neg_jessie_at_448'), (neg_jessie_at_448(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_jessie_aux().

