:- include('database.pl').
adventure_time(Start,End) :- begin('adventure_time',_,_,Start), end('adventure_time',_,_,End), Start=<End.

finally_adventure_time_during_7_17(Start,End) :- adventure_time(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

compare_finally_adventure_time_during_7_17(Dir,finally_adventure_time_during_7_17(Start1,_),finally_adventure_time_during_7_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_adventure_time_during_7_17([]).

generate_neg_finally_adventure_time_during_7_17([(Start,End) | Tail]) :- assert(neg_finally_adventure_time_during_7_17(Start,End)), generate_neg_finally_adventure_time_during_7_17(Tail).

sort_finally_adventure_time_during_7_17(SortedIntervals) :- findall((Start,End),finally_adventure_time_during_7_17(Start,End),UnsortedIntervals), predsort(compare_finally_adventure_time_during_7_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_adventure_time_during_7_17_aux() :- sort_finally_adventure_time_during_7_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_adventure_time_during_7_17(NegatedIntervals).

neg_finally_adventure_time_during_7_17_at_1947(Res) :- setof((Start,End),neg_finally_adventure_time_during_7_17(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = neg_finally_adventure_time_during_7_17_at_1947'), (neg_finally_adventure_time_during_7_17_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_adventure_time_during_7_17_aux().

