:- include('database.pl').
arab_revolt(Start,End) :- begin('arab_revolt',_,_,Start), end('arab_revolt',_,_,End), Start=<End.

compare_arab_revolt(Dir,arab_revolt(Start1,_),arab_revolt(Start2,_)) :- Start1=<Start2.

generate_neg_arab_revolt([]).

generate_neg_arab_revolt([(Start,End) | Tail]) :- assert(neg_arab_revolt(Start,End)), generate_neg_arab_revolt(Tail).

sort_arab_revolt(SortedIntervals) :- findall((Start,End),arab_revolt(Start,End),UnsortedIntervals), predsort(compare_arab_revolt,UnsortedIntervals,SortedIntervals).

generate_neg_arab_revolt_aux() :- sort_arab_revolt(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_arab_revolt(NegatedIntervals).

neg_arab_revolt_at_1601(Res) :- setof((Start,End),neg_arab_revolt(Start,End),AllINtervals), checkvalidity(1601,AllINtervals,Res).

check_query() :- write('Query = neg_arab_revolt_at_1601'), (neg_arab_revolt_at_1601(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_arab_revolt_aux().

