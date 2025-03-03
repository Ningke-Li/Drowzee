:- include('database.pl').
tom_and_jerry(Start,End) :- begin('tom_and_jerry',_,_,Start), end('tom_and_jerry',_,_,End), Start=<End.

finally_tom_and_jerry_during_6_12(Start,End) :- tom_and_jerry(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

compare_finally_tom_and_jerry_during_6_12(Dir,finally_tom_and_jerry_during_6_12(Start1,_),finally_tom_and_jerry_during_6_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_tom_and_jerry_during_6_12([]).

generate_neg_finally_tom_and_jerry_during_6_12([(Start,End) | Tail]) :- assert(neg_finally_tom_and_jerry_during_6_12(Start,End)), generate_neg_finally_tom_and_jerry_during_6_12(Tail).

sort_finally_tom_and_jerry_during_6_12(SortedIntervals) :- findall((Start,End),finally_tom_and_jerry_during_6_12(Start,End),UnsortedIntervals), predsort(compare_finally_tom_and_jerry_during_6_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_tom_and_jerry_during_6_12_aux() :- sort_finally_tom_and_jerry_during_6_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_tom_and_jerry_during_6_12(NegatedIntervals).

neg_finally_tom_and_jerry_during_6_12_at_1908(Res) :- setof((Start,End),neg_finally_tom_and_jerry_during_6_12(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = neg_finally_tom_and_jerry_during_6_12_at_1908'), (neg_finally_tom_and_jerry_during_6_12_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_tom_and_jerry_during_6_12_aux().

