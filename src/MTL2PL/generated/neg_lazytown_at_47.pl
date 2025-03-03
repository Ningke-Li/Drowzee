:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

compare_lazytown(Dir,lazytown(Start1,_),lazytown(Start2,_)) :- Start1=<Start2.

generate_neg_lazytown([]).

generate_neg_lazytown([(Start,End) | Tail]) :- assert(neg_lazytown(Start,End)), generate_neg_lazytown(Tail).

sort_lazytown(SortedIntervals) :- findall((Start,End),lazytown(Start,End),UnsortedIntervals), predsort(compare_lazytown,UnsortedIntervals,SortedIntervals).

generate_neg_lazytown_aux() :- sort_lazytown(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_lazytown(NegatedIntervals).

neg_lazytown_at_47(Res) :- setof((Start,End),neg_lazytown(Start,End),AllINtervals), checkvalidity(47,AllINtervals,Res).

check_query() :- write('Query = neg_lazytown_at_47'), (neg_lazytown_at_47(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_lazytown_aux().

