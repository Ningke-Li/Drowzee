:- include('database.pl').
brothers___sisters(Start,End) :- begin('brothers___sisters',_,_,Start), end('brothers___sisters',_,_,End), Start=<End.

finally_brothers___sisters_during_2_18(Start,End) :- brothers___sisters(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

compare_finally_brothers___sisters_during_2_18(Dir,finally_brothers___sisters_during_2_18(Start1,_),finally_brothers___sisters_during_2_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_brothers___sisters_during_2_18([]).

generate_neg_finally_brothers___sisters_during_2_18([(Start,End) | Tail]) :- assert(neg_finally_brothers___sisters_during_2_18(Start,End)), generate_neg_finally_brothers___sisters_during_2_18(Tail).

sort_finally_brothers___sisters_during_2_18(SortedIntervals) :- findall((Start,End),finally_brothers___sisters_during_2_18(Start,End),UnsortedIntervals), predsort(compare_finally_brothers___sisters_during_2_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_brothers___sisters_during_2_18_aux() :- sort_finally_brothers___sisters_during_2_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_brothers___sisters_during_2_18(NegatedIntervals).

neg_finally_brothers___sisters_during_2_18_at_589(Res) :- setof((Start,End),neg_finally_brothers___sisters_during_2_18(Start,End),AllINtervals), checkvalidity(589,AllINtervals,Res).

check_query() :- write('Query = neg_finally_brothers___sisters_during_2_18_at_589'), (neg_finally_brothers___sisters_during_2_18_at_589(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_brothers___sisters_during_2_18_aux().

