:- include('database.pl').
mahdist_war(Start,End) :- begin('mahdist_war',_,_,Start), end('mahdist_war',_,_,End), Start=<End.

finally_mahdist_war_during_6_11(Start,End) :- mahdist_war(Start1,End1), (Start1-11)=<(End1-6), Start is (Start1-11), End is (End1-6), Start=<End.

compare_finally_mahdist_war_during_6_11(Dir,finally_mahdist_war_during_6_11(Start1,_),finally_mahdist_war_during_6_11(Start2,_)) :- Start1=<Start2.

generate_neg_finally_mahdist_war_during_6_11([]).

generate_neg_finally_mahdist_war_during_6_11([(Start,End) | Tail]) :- assert(neg_finally_mahdist_war_during_6_11(Start,End)), generate_neg_finally_mahdist_war_during_6_11(Tail).

sort_finally_mahdist_war_during_6_11(SortedIntervals) :- findall((Start,End),finally_mahdist_war_during_6_11(Start,End),UnsortedIntervals), predsort(compare_finally_mahdist_war_during_6_11,UnsortedIntervals,SortedIntervals).

generate_neg_finally_mahdist_war_during_6_11_aux() :- sort_finally_mahdist_war_during_6_11(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_mahdist_war_during_6_11(NegatedIntervals).

neg_finally_mahdist_war_during_6_11_at_401(Res) :- setof((Start,End),neg_finally_mahdist_war_during_6_11(Start,End),AllINtervals), checkvalidity(401,AllINtervals,Res).

check_query() :- write('Query = neg_finally_mahdist_war_during_6_11_at_401'), (neg_finally_mahdist_war_during_6_11_at_401(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_mahdist_war_during_6_11_aux().

