:- include('database.pl').
hurricane_patricia(Start,End) :- begin('hurricane_patricia',_,_,Start), end('hurricane_patricia',_,_,End), Start=<End.

compare_hurricane_patricia(Dir,hurricane_patricia(Start1,_),hurricane_patricia(Start2,_)) :- Start1=<Start2.

generate_neg_hurricane_patricia([]).

generate_neg_hurricane_patricia([(Start,End) | Tail]) :- assert(neg_hurricane_patricia(Start,End)), generate_neg_hurricane_patricia(Tail).

sort_hurricane_patricia(SortedIntervals) :- findall((Start,End),hurricane_patricia(Start,End),UnsortedIntervals), predsort(compare_hurricane_patricia,UnsortedIntervals,SortedIntervals).

generate_neg_hurricane_patricia_aux() :- sort_hurricane_patricia(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_hurricane_patricia(NegatedIntervals).

neg_hurricane_patricia_at_1819(Res) :- setof((Start,End),neg_hurricane_patricia(Start,End),AllINtervals), checkvalidity(1819,AllINtervals,Res).

check_query() :- write('Query = neg_hurricane_patricia_at_1819'), (neg_hurricane_patricia_at_1819(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_hurricane_patricia_aux().

