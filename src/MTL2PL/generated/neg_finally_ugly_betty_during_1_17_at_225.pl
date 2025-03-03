:- include('database.pl').
ugly_betty(Start,End) :- begin('ugly_betty',_,_,Start), end('ugly_betty',_,_,End), Start=<End.

finally_ugly_betty_during_1_17(Start,End) :- ugly_betty(Start1,End1), (Start1-17)=<(End1-1), Start is (Start1-17), End is (End1-1), Start=<End.

compare_finally_ugly_betty_during_1_17(Dir,finally_ugly_betty_during_1_17(Start1,_),finally_ugly_betty_during_1_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_ugly_betty_during_1_17([]).

generate_neg_finally_ugly_betty_during_1_17([(Start,End) | Tail]) :- assert(neg_finally_ugly_betty_during_1_17(Start,End)), generate_neg_finally_ugly_betty_during_1_17(Tail).

sort_finally_ugly_betty_during_1_17(SortedIntervals) :- findall((Start,End),finally_ugly_betty_during_1_17(Start,End),UnsortedIntervals), predsort(compare_finally_ugly_betty_during_1_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_ugly_betty_during_1_17_aux() :- sort_finally_ugly_betty_during_1_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_ugly_betty_during_1_17(NegatedIntervals).

neg_finally_ugly_betty_during_1_17_at_225(Res) :- setof((Start,End),neg_finally_ugly_betty_during_1_17(Start,End),AllINtervals), checkvalidity(225,AllINtervals,Res).

check_query() :- write('Query = neg_finally_ugly_betty_during_1_17_at_225'), (neg_finally_ugly_betty_during_1_17_at_225(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_ugly_betty_during_1_17_aux().

