:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

finally_belgian_franc_during_2_13(Start,End) :- belgian_franc(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

compare_finally_belgian_franc_during_2_13(Dir,finally_belgian_franc_during_2_13(Start1,_),finally_belgian_franc_during_2_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_belgian_franc_during_2_13([]).

generate_neg_finally_belgian_franc_during_2_13([(Start,End) | Tail]) :- assert(neg_finally_belgian_franc_during_2_13(Start,End)), generate_neg_finally_belgian_franc_during_2_13(Tail).

sort_finally_belgian_franc_during_2_13(SortedIntervals) :- findall((Start,End),finally_belgian_franc_during_2_13(Start,End),UnsortedIntervals), predsort(compare_finally_belgian_franc_during_2_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_belgian_franc_during_2_13_aux() :- sort_finally_belgian_franc_during_2_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_belgian_franc_during_2_13(NegatedIntervals).

neg_finally_belgian_franc_during_2_13_at_358(Res) :- setof((Start,End),neg_finally_belgian_franc_during_2_13(Start,End),AllINtervals), checkvalidity(358,AllINtervals,Res).

check_query() :- write('Query = neg_finally_belgian_franc_during_2_13_at_358'), (neg_finally_belgian_franc_during_2_13_at_358(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_belgian_franc_during_2_13_aux().

