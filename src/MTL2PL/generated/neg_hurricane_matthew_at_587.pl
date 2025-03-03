:- include('database.pl').
hurricane_matthew(Start,End) :- begin('hurricane_matthew',_,_,Start), end('hurricane_matthew',_,_,End), Start=<End.

compare_hurricane_matthew(Dir,hurricane_matthew(Start1,_),hurricane_matthew(Start2,_)) :- Start1=<Start2.

generate_neg_hurricane_matthew([]).

generate_neg_hurricane_matthew([(Start,End) | Tail]) :- assert(neg_hurricane_matthew(Start,End)), generate_neg_hurricane_matthew(Tail).

sort_hurricane_matthew(SortedIntervals) :- findall((Start,End),hurricane_matthew(Start,End),UnsortedIntervals), predsort(compare_hurricane_matthew,UnsortedIntervals,SortedIntervals).

generate_neg_hurricane_matthew_aux() :- sort_hurricane_matthew(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_hurricane_matthew(NegatedIntervals).

neg_hurricane_matthew_at_587(Res) :- setof((Start,End),neg_hurricane_matthew(Start,End),AllINtervals), checkvalidity(587,AllINtervals,Res).

check_query() :- write('Query = neg_hurricane_matthew_at_587'), (neg_hurricane_matthew_at_587(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_hurricane_matthew_aux().

