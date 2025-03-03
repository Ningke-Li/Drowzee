:- include('database.pl').
without_a_trace(Start,End) :- begin('without_a_trace',_,_,Start), end('without_a_trace',_,_,End), Start=<End.

finally_without_a_trace_during_5_14(Start,End) :- without_a_trace(Start1,End1), (Start1-14)=<(End1-5), Start is (Start1-14), End is (End1-5), Start=<End.

compare_finally_without_a_trace_during_5_14(Dir,finally_without_a_trace_during_5_14(Start1,_),finally_without_a_trace_during_5_14(Start2,_)) :- Start1=<Start2.

generate_neg_finally_without_a_trace_during_5_14([]).

generate_neg_finally_without_a_trace_during_5_14([(Start,End) | Tail]) :- assert(neg_finally_without_a_trace_during_5_14(Start,End)), generate_neg_finally_without_a_trace_during_5_14(Tail).

sort_finally_without_a_trace_during_5_14(SortedIntervals) :- findall((Start,End),finally_without_a_trace_during_5_14(Start,End),UnsortedIntervals), predsort(compare_finally_without_a_trace_during_5_14,UnsortedIntervals,SortedIntervals).

generate_neg_finally_without_a_trace_during_5_14_aux() :- sort_finally_without_a_trace_during_5_14(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_without_a_trace_during_5_14(NegatedIntervals).

neg_finally_without_a_trace_during_5_14_at_209(Res) :- setof((Start,End),neg_finally_without_a_trace_during_5_14(Start,End),AllINtervals), checkvalidity(209,AllINtervals,Res).

check_query() :- write('Query = neg_finally_without_a_trace_during_5_14_at_209'), (neg_finally_without_a_trace_during_5_14_at_209(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_without_a_trace_during_5_14_aux().

