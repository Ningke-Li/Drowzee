:- include('database.pl').
california_gold_rush(Start,End) :- begin('california_gold_rush',_,_,Start), end('california_gold_rush',_,_,End), Start=<End.

finally_california_gold_rush_during_7_11(Start,End) :- california_gold_rush(Start1,End1), (Start1-11)=<(End1-7), Start is (Start1-11), End is (End1-7), Start=<End.

compare_finally_california_gold_rush_during_7_11(Dir,finally_california_gold_rush_during_7_11(Start1,_),finally_california_gold_rush_during_7_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_california_gold_rush_during_7_11([]).

generate_neg_finally_california_gold_rush_during_7_11([(Start,End) | Tail]) :- assert(neg_finally_california_gold_rush_during_7_11(Start,End)), generate_neg_finally_california_gold_rush_during_7_11(Tail).

sort_finally_california_gold_rush_during_7_11(SortedIntervals) :- findall((Start,End),finally_california_gold_rush_during_7_11(Start,End),UnsortedIntervals), predsort(compare_finally_california_gold_rush_during_7_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_california_gold_rush_during_7_11_aux() :- sort_finally_california_gold_rush_during_7_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_california_gold_rush_during_7_11(NegatedIntervals).

neg_finally_california_gold_rush_during_7_11_at_1005(Res) :- setof((Start,End),neg_finally_california_gold_rush_during_7_11(Start,End),AllINtervals), checkvalidity(1005,AllINtervals,Res).

check_query() :- write('Query = neg_finally_california_gold_rush_during_7_11_at_1005'), (neg_finally_california_gold_rush_during_7_11_at_1005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_california_gold_rush_during_7_11_aux().

