:- include('database.pl').
chaco_war(Start,End) :- begin('chaco_war',_,_,Start), end('chaco_war',_,_,End), Start=<End.

finally_chaco_war_during_4_17(Start,End) :- chaco_war(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

compare_finally_chaco_war_during_4_17(Dir,finally_chaco_war_during_4_17(Start1,_),finally_chaco_war_during_4_17(Start2,_)) :- Start1=<Start2.

generate_neg_finally_chaco_war_during_4_17([]).

generate_neg_finally_chaco_war_during_4_17([(Start,End) | Tail]) :- assert(neg_finally_chaco_war_during_4_17(Start,End)), generate_neg_finally_chaco_war_during_4_17(Tail).

sort_finally_chaco_war_during_4_17(SortedIntervals) :- findall((Start,End),finally_chaco_war_during_4_17(Start,End),UnsortedIntervals), predsort(compare_finally_chaco_war_during_4_17,UnsortedIntervals,SortedIntervals).

generate_neg_finally_chaco_war_during_4_17_aux() :- sort_finally_chaco_war_during_4_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_chaco_war_during_4_17(NegatedIntervals).

neg_finally_chaco_war_during_4_17_at_1692(Res) :- setof((Start,End),neg_finally_chaco_war_during_4_17(Start,End),AllINtervals), checkvalidity(1692,AllINtervals,Res).

check_query() :- write('Query = neg_finally_chaco_war_during_4_17_at_1692'), (neg_finally_chaco_war_during_4_17_at_1692(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_chaco_war_during_4_17_aux().

