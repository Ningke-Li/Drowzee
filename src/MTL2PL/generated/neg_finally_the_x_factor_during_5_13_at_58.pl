:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

finally_the_x_factor_during_5_13(Start,End) :- the_x_factor(Start1,End1), (Start1-13)=<(End1-5), Start is (Start1-13), End is (End1-5), Start=<End.

compare_finally_the_x_factor_during_5_13(Dir,finally_the_x_factor_during_5_13(Start1,_),finally_the_x_factor_during_5_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_the_x_factor_during_5_13([]).

generate_neg_finally_the_x_factor_during_5_13([(Start,End) | Tail]) :- assert(neg_finally_the_x_factor_during_5_13(Start,End)), generate_neg_finally_the_x_factor_during_5_13(Tail).

sort_finally_the_x_factor_during_5_13(SortedIntervals) :- findall((Start,End),finally_the_x_factor_during_5_13(Start,End),UnsortedIntervals), predsort(compare_finally_the_x_factor_during_5_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_the_x_factor_during_5_13_aux() :- sort_finally_the_x_factor_during_5_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_the_x_factor_during_5_13(NegatedIntervals).

neg_finally_the_x_factor_during_5_13_at_58(Res) :- setof((Start,End),neg_finally_the_x_factor_during_5_13(Start,End),AllINtervals), checkvalidity(58,AllINtervals,Res).

check_query() :- write('Query = neg_finally_the_x_factor_during_5_13_at_58'), (neg_finally_the_x_factor_during_5_13_at_58(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_the_x_factor_during_5_13_aux().

