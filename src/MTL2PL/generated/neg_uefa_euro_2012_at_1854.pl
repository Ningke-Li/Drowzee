:- include('database.pl').
uefa_euro_2012(Start,End) :- begin('uefa_euro_2012',_,_,Start), end('uefa_euro_2012',_,_,End), Start=<End.

compare_uefa_euro_2012(Dir,uefa_euro_2012(Start1,_),uefa_euro_2012(Start2,_)) :- Start1=<Start2.

generate_neg_uefa_euro_2012([]).

generate_neg_uefa_euro_2012([(Start,End) | Tail]) :- assert(neg_uefa_euro_2012(Start,End)), generate_neg_uefa_euro_2012(Tail).

sort_uefa_euro_2012(SortedIntervals) :- findall((Start,End),uefa_euro_2012(Start,End),UnsortedIntervals), predsort(compare_uefa_euro_2012,UnsortedIntervals,SortedIntervals).

generate_neg_uefa_euro_2012_aux() :- sort_uefa_euro_2012(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_uefa_euro_2012(NegatedIntervals).

neg_uefa_euro_2012_at_1854(Res) :- setof((Start,End),neg_uefa_euro_2012(Start,End),AllINtervals), checkvalidity(1854,AllINtervals,Res).

check_query() :- write('Query = neg_uefa_euro_2012_at_1854'), (neg_uefa_euro_2012_at_1854(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_uefa_euro_2012_aux().

