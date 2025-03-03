:- include('database.pl').
breaking_bad(Start,End) :- begin('breaking_bad',_,_,Start), end('breaking_bad',_,_,End), Start=<End.

compare_breaking_bad(Dir,breaking_bad(Start1,_),breaking_bad(Start2,_)) :- Start1=<Start2.

generate_neg_breaking_bad([]).

generate_neg_breaking_bad([(Start,End) | Tail]) :- assert(neg_breaking_bad(Start,End)), generate_neg_breaking_bad(Tail).

sort_breaking_bad(SortedIntervals) :- findall((Start,End),breaking_bad(Start,End),UnsortedIntervals), predsort(compare_breaking_bad,UnsortedIntervals,SortedIntervals).

generate_neg_breaking_bad_aux() :- sort_breaking_bad(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_breaking_bad(NegatedIntervals).

neg_breaking_bad_at_906(Res) :- setof((Start,End),neg_breaking_bad(Start,End),AllINtervals), checkvalidity(906,AllINtervals,Res).

check_query() :- write('Query = neg_breaking_bad_at_906'), (neg_breaking_bad_at_906(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_breaking_bad_aux().

