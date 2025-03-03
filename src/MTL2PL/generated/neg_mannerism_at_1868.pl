:- include('database.pl').
mannerism(Start,End) :- begin('mannerism',_,_,Start), end('mannerism',_,_,End), Start=<End.

compare_mannerism(Dir,mannerism(Start1,_),mannerism(Start2,_)) :- Start1=<Start2.

generate_neg_mannerism([]).

generate_neg_mannerism([(Start,End) | Tail]) :- assert(neg_mannerism(Start,End)), generate_neg_mannerism(Tail).

sort_mannerism(SortedIntervals) :- findall((Start,End),mannerism(Start,End),UnsortedIntervals), predsort(compare_mannerism,UnsortedIntervals,SortedIntervals).

generate_neg_mannerism_aux() :- sort_mannerism(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_mannerism(NegatedIntervals).

neg_mannerism_at_1868(Res) :- setof((Start,End),neg_mannerism(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = neg_mannerism_at_1868'), (neg_mannerism_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_mannerism_aux().

