:- include('database.pl').
jackass(Start,End) :- begin('jackass',_,_,Start), end('jackass',_,_,End), Start=<End.

compare_jackass(Dir,jackass(Start1,_),jackass(Start2,_)) :- Start1=<Start2.

generate_neg_jackass([]).

generate_neg_jackass([(Start,End) | Tail]) :- assert(neg_jackass(Start,End)), generate_neg_jackass(Tail).

sort_jackass(SortedIntervals) :- findall((Start,End),jackass(Start,End),UnsortedIntervals), predsort(compare_jackass,UnsortedIntervals,SortedIntervals).

generate_neg_jackass_aux() :- sort_jackass(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_jackass(NegatedIntervals).

neg_jackass_at_2046(Res) :- setof((Start,End),neg_jackass(Start,End),AllINtervals), checkvalidity(2046,AllINtervals,Res).

check_query() :- write('Query = neg_jackass_at_2046'), (neg_jackass_at_2046(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_jackass_aux().

