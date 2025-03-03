:- include('database.pl').
uefa_euro_2016_qualifying(Start,End) :- begin('uefa_euro_2016_qualifying',_,_,Start), end('uefa_euro_2016_qualifying',_,_,End), Start=<End.

compare_uefa_euro_2016_qualifying(Dir,uefa_euro_2016_qualifying(Start1,_),uefa_euro_2016_qualifying(Start2,_)) :- Start1=<Start2.

generate_neg_uefa_euro_2016_qualifying([]).

generate_neg_uefa_euro_2016_qualifying([(Start,End) | Tail]) :- assert(neg_uefa_euro_2016_qualifying(Start,End)), generate_neg_uefa_euro_2016_qualifying(Tail).

sort_uefa_euro_2016_qualifying(SortedIntervals) :- findall((Start,End),uefa_euro_2016_qualifying(Start,End),UnsortedIntervals), predsort(compare_uefa_euro_2016_qualifying,UnsortedIntervals,SortedIntervals).

generate_neg_uefa_euro_2016_qualifying_aux() :- sort_uefa_euro_2016_qualifying(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_uefa_euro_2016_qualifying(NegatedIntervals).

neg_uefa_euro_2016_qualifying_at_868(Res) :- setof((Start,End),neg_uefa_euro_2016_qualifying(Start,End),AllINtervals), checkvalidity(868,AllINtervals,Res).

check_query() :- write('Query = neg_uefa_euro_2016_qualifying_at_868'), (neg_uefa_euro_2016_qualifying_at_868(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_uefa_euro_2016_qualifying_aux().

