:- include('database.pl').
first_vatican_council(Start,End) :- begin('first_vatican_council',_,_,Start), end('first_vatican_council',_,_,End), Start=<End.

compare_first_vatican_council(Dir,first_vatican_council(Start1,_),first_vatican_council(Start2,_)) :- Start1=<Start2.

generate_neg_first_vatican_council([]).

generate_neg_first_vatican_council([(Start,End) | Tail]) :- assert(neg_first_vatican_council(Start,End)), generate_neg_first_vatican_council(Tail).

sort_first_vatican_council(SortedIntervals) :- findall((Start,End),first_vatican_council(Start,End),UnsortedIntervals), predsort(compare_first_vatican_council,UnsortedIntervals,SortedIntervals).

generate_neg_first_vatican_council_aux() :- sort_first_vatican_council(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_first_vatican_council(NegatedIntervals).

neg_first_vatican_council_at_1504(Res) :- setof((Start,End),neg_first_vatican_council(Start,End),AllINtervals), checkvalidity(1504,AllINtervals,Res).

check_query() :- write('Query = neg_first_vatican_council_at_1504'), (neg_first_vatican_council_at_1504(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_first_vatican_council_aux().

