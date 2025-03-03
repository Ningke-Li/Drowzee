:- include('database.pl').
greek_civil_war(Start,End) :- begin('greek_civil_war',_,_,Start), end('greek_civil_war',_,_,End), Start=<End.

finally_greek_civil_war_during_9_12(Start,End) :- greek_civil_war(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

compare_finally_greek_civil_war_during_9_12(Dir,finally_greek_civil_war_during_9_12(Start1,_),finally_greek_civil_war_during_9_12(Start2,_)) :- Start1=<Start2.

generate_neg_finally_greek_civil_war_during_9_12([]).

generate_neg_finally_greek_civil_war_during_9_12([(Start,End) | Tail]) :- assert(neg_finally_greek_civil_war_during_9_12(Start,End)), generate_neg_finally_greek_civil_war_during_9_12(Tail).

sort_finally_greek_civil_war_during_9_12(SortedIntervals) :- findall((Start,End),finally_greek_civil_war_during_9_12(Start,End),UnsortedIntervals), predsort(compare_finally_greek_civil_war_during_9_12,UnsortedIntervals,SortedIntervals).

generate_neg_finally_greek_civil_war_during_9_12_aux() :- sort_finally_greek_civil_war_during_9_12(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_greek_civil_war_during_9_12(NegatedIntervals).

neg_finally_greek_civil_war_during_9_12_at_1204(Res) :- setof((Start,End),neg_finally_greek_civil_war_during_9_12(Start,End),AllINtervals), checkvalidity(1204,AllINtervals,Res).

check_query() :- write('Query = neg_finally_greek_civil_war_during_9_12_at_1204'), (neg_finally_greek_civil_war_during_9_12_at_1204(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_greek_civil_war_during_9_12_aux().

