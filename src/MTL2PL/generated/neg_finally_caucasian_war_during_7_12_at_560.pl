:- include('database.pl').
caucasian_war(Start,End) :- begin('caucasian_war',_,_,Start), end('caucasian_war',_,_,End), Start=<End.

finally_caucasian_war_during_7_12(Start,End) :- caucasian_war(Start1,End1), (Start1-12)=<(End1-7), Start is (Start1-12), End is (End1-7), Start=<End.

compare_finally_caucasian_war_during_7_12(Dir,finally_caucasian_war_during_7_12(Start1,_),finally_caucasian_war_during_7_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_caucasian_war_during_7_12([]).

generate_neg_finally_caucasian_war_during_7_12([(Start,End) | Tail]) :- assert(neg_finally_caucasian_war_during_7_12(Start,End)), generate_neg_finally_caucasian_war_during_7_12(Tail).

sort_finally_caucasian_war_during_7_12(SortedIntervals) :- findall((Start,End),finally_caucasian_war_during_7_12(Start,End),UnsortedIntervals), predsort(compare_finally_caucasian_war_during_7_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_caucasian_war_during_7_12_aux() :- sort_finally_caucasian_war_during_7_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_caucasian_war_during_7_12(NegatedIntervals).

neg_finally_caucasian_war_during_7_12_at_560(Res) :- setof((Start,End),neg_finally_caucasian_war_during_7_12(Start,End),AllINtervals), checkvalidity(560,AllINtervals,Res).

check_query() :- write('Query = neg_finally_caucasian_war_during_7_12_at_560'), (neg_finally_caucasian_war_during_7_12_at_560(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_caucasian_war_during_7_12_aux().

