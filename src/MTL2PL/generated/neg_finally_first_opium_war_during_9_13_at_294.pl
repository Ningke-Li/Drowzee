:- include('database.pl').
first_opium_war(Start,End) :- begin('first_opium_war',_,_,Start), end('first_opium_war',_,_,End), Start=<End.

finally_first_opium_war_during_9_13(Start,End) :- first_opium_war(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

compare_finally_first_opium_war_during_9_13(Dir,finally_first_opium_war_during_9_13(Start1,_),finally_first_opium_war_during_9_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_first_opium_war_during_9_13([]).

generate_neg_finally_first_opium_war_during_9_13([(Start,End) | Tail]) :- assert(neg_finally_first_opium_war_during_9_13(Start,End)), generate_neg_finally_first_opium_war_during_9_13(Tail).

sort_finally_first_opium_war_during_9_13(SortedIntervals) :- findall((Start,End),finally_first_opium_war_during_9_13(Start,End),UnsortedIntervals), predsort(compare_finally_first_opium_war_during_9_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_first_opium_war_during_9_13_aux() :- sort_finally_first_opium_war_during_9_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_first_opium_war_during_9_13(NegatedIntervals).

neg_finally_first_opium_war_during_9_13_at_294(Res) :- setof((Start,End),neg_finally_first_opium_war_during_9_13(Start,End),AllINtervals), checkvalidity(294,AllINtervals,Res).

check_query() :- write('Query = neg_finally_first_opium_war_during_9_13_at_294'), (neg_finally_first_opium_war_during_9_13_at_294(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_first_opium_war_during_9_13_aux().

