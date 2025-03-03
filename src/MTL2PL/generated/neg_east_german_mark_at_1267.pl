:- include('database.pl').
east_german_mark(Start,End) :- begin('east_german_mark',_,_,Start), end('east_german_mark',_,_,End), Start=<End.

compare_east_german_mark(Dir,east_german_mark(Start1,_),east_german_mark(Start2,_)) :- Start1=<Start2.

generate_neg_east_german_mark([]).

generate_neg_east_german_mark([(Start,End) | Tail]) :- assert(neg_east_german_mark(Start,End)), generate_neg_east_german_mark(Tail).

sort_east_german_mark(SortedIntervals) :- findall((Start,End),east_german_mark(Start,End),UnsortedIntervals), predsort(compare_east_german_mark,UnsortedIntervals,SortedIntervals).

generate_neg_east_german_mark_aux() :- sort_east_german_mark(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_east_german_mark(NegatedIntervals).

neg_east_german_mark_at_1267(Res) :- setof((Start,End),neg_east_german_mark(Start,End),AllINtervals), checkvalidity(1267,AllINtervals,Res).

check_query() :- write('Query = neg_east_german_mark_at_1267'), (neg_east_german_mark_at_1267(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_east_german_mark_aux().

