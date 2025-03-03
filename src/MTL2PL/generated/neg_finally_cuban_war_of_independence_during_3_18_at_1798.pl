:- include('database.pl').
cuban_war_of_independence(Start,End) :- begin('cuban_war_of_independence',_,_,Start), end('cuban_war_of_independence',_,_,End), Start=<End.

finally_cuban_war_of_independence_during_3_18(Start,End) :- cuban_war_of_independence(Start1,End1), (Start1-18)=<(End1-3), Start is (Start1-18), End is (End1-3), Start=<End.

compare_finally_cuban_war_of_independence_during_3_18(Dir,finally_cuban_war_of_independence_during_3_18(Start1,_),finally_cuban_war_of_independence_during_3_18(Start2,_)) :- Start1=<Start2.

generate_neg_finally_cuban_war_of_independence_during_3_18([]).

generate_neg_finally_cuban_war_of_independence_during_3_18([(Start,End) | Tail]) :- assert(neg_finally_cuban_war_of_independence_during_3_18(Start,End)), generate_neg_finally_cuban_war_of_independence_during_3_18(Tail).

sort_finally_cuban_war_of_independence_during_3_18(SortedIntervals) :- findall((Start,End),finally_cuban_war_of_independence_during_3_18(Start,End),UnsortedIntervals), predsort(compare_finally_cuban_war_of_independence_during_3_18,UnsortedIntervals,SortedIntervals).

generate_neg_finally_cuban_war_of_independence_during_3_18_aux() :- sort_finally_cuban_war_of_independence_during_3_18(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_cuban_war_of_independence_during_3_18(NegatedIntervals).

neg_finally_cuban_war_of_independence_during_3_18_at_1798(Res) :- setof((Start,End),neg_finally_cuban_war_of_independence_during_3_18(Start,End),AllINtervals), checkvalidity(1798,AllINtervals,Res).

check_query() :- write('Query = neg_finally_cuban_war_of_independence_during_3_18_at_1798'), (neg_finally_cuban_war_of_independence_during_3_18_at_1798(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_cuban_war_of_independence_during_3_18_aux().

