:- include('database.pl').
medium(Start,End) :- begin('medium',_,_,Start), end('medium',_,_,End), Start=<End.

finally_medium_during_9_15(Start,End) :- medium(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

compare_finally_medium_during_9_15(Dir,finally_medium_during_9_15(Start1,_),finally_medium_during_9_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_medium_during_9_15([]).

generate_neg_finally_medium_during_9_15([(Start,End) | Tail]) :- assert(neg_finally_medium_during_9_15(Start,End)), generate_neg_finally_medium_during_9_15(Tail).

sort_finally_medium_during_9_15(SortedIntervals) :- findall((Start,End),finally_medium_during_9_15(Start,End),UnsortedIntervals), predsort(compare_finally_medium_during_9_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_medium_during_9_15_aux() :- sort_finally_medium_during_9_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_medium_during_9_15(NegatedIntervals).

neg_finally_medium_during_9_15_at_1719(Res) :- setof((Start,End),neg_finally_medium_during_9_15(Start,End),AllINtervals), checkvalidity(1719,AllINtervals,Res).

check_query() :- write('Query = neg_finally_medium_during_9_15_at_1719'), (neg_finally_medium_during_9_15_at_1719(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_medium_during_9_15_aux().

