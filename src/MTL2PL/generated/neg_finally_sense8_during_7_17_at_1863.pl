:- include('database.pl').
sense8(Start,End) :- begin('sense8',_,_,Start), end('sense8',_,_,End), Start=<End.

finally_sense8_during_7_17(Start,End) :- sense8(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

compare_finally_sense8_during_7_17(Dir,finally_sense8_during_7_17(Start1,_),finally_sense8_during_7_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_sense8_during_7_17([]).

generate_neg_finally_sense8_during_7_17([(Start,End) | Tail]) :- assert(neg_finally_sense8_during_7_17(Start,End)), generate_neg_finally_sense8_during_7_17(Tail).

sort_finally_sense8_during_7_17(SortedIntervals) :- findall((Start,End),finally_sense8_during_7_17(Start,End),UnsortedIntervals), predsort(compare_finally_sense8_during_7_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_sense8_during_7_17_aux() :- sort_finally_sense8_during_7_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_sense8_during_7_17(NegatedIntervals).

neg_finally_sense8_during_7_17_at_1863(Res) :- setof((Start,End),neg_finally_sense8_during_7_17(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = neg_finally_sense8_during_7_17_at_1863'), (neg_finally_sense8_during_7_17_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_sense8_during_7_17_aux().

