:- include('database.pl').
first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

finally_first_opium_war_during_6_15(Start,End) :- first_opium_war(Start1,End1), (Start1-15)=<(End1-6), Start is (Start1-15), End is (End1-6), Start=<End.

compare_finally_first_opium_war_during_6_15(Dir,finally_first_opium_war_during_6_15(Start1,_),finally_first_opium_war_during_6_15(Start2,_)) :- Start1=<Start2.

generate_neg_finally_first_opium_war_during_6_15([]).

generate_neg_finally_first_opium_war_during_6_15([(Start,End) | Tail]) :- assert(neg_finally_first_opium_war_during_6_15(Start,End)), generate_neg_finally_first_opium_war_during_6_15(Tail).

sort_finally_first_opium_war_during_6_15(SortedIntervals) :- findall((Start,End),finally_first_opium_war_during_6_15(Start,End),UnsortedIntervals), predsort(compare_finally_first_opium_war_during_6_15,UnsortedIntervals,SortedIntervals).

generate_neg_finally_first_opium_war_during_6_15_aux() :- sort_finally_first_opium_war_during_6_15(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_first_opium_war_during_6_15(NegatedIntervals).

neg_finally_first_opium_war_during_6_15_at_623(Res) :- setof((Start,End),neg_finally_first_opium_war_during_6_15(Start,End),AllINtervals), checkvalidity(623,AllINtervals,Res).

check_query() :- write('Query = neg_finally_first_opium_war_during_6_15_at_623'), (neg_finally_first_opium_war_during_6_15_at_623(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_first_opium_war_during_6_15_aux().

