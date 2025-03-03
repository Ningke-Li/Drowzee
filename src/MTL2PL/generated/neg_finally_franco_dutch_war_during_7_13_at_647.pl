:- include('database.pl').
franco_dutch_war(Start,End) :- begin('franco_dutch_war',_,_,Start), end('franco_dutch_war',_,_,End), Start=<End.

finally_franco_dutch_war_during_7_13(Start,End) :- franco_dutch_war(Start1,End1), (Start1-13)=<(End1-7), Start is (Start1-13), End is (End1-7), Start=<End.

compare_finally_franco_dutch_war_during_7_13(Dir,finally_franco_dutch_war_during_7_13(Start1,_),finally_franco_dutch_war_during_7_13(Start2,_)) :- Start1=<Start2.

generate_neg_finally_franco_dutch_war_during_7_13([]).

generate_neg_finally_franco_dutch_war_during_7_13([(Start,End) | Tail]) :- assert(neg_finally_franco_dutch_war_during_7_13(Start,End)), generate_neg_finally_franco_dutch_war_during_7_13(Tail).

sort_finally_franco_dutch_war_during_7_13(SortedIntervals) :- findall((Start,End),finally_franco_dutch_war_during_7_13(Start,End),UnsortedIntervals), predsort(compare_finally_franco_dutch_war_during_7_13,UnsortedIntervals,SortedIntervals).

generate_neg_finally_franco_dutch_war_during_7_13_aux() :- sort_finally_franco_dutch_war_during_7_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_franco_dutch_war_during_7_13(NegatedIntervals).

neg_finally_franco_dutch_war_during_7_13_at_647(Res) :- setof((Start,End),neg_finally_franco_dutch_war_during_7_13(Start,End),AllINtervals), checkvalidity(647,AllINtervals,Res).

check_query() :- write('Query = neg_finally_franco_dutch_war_during_7_13_at_647'), (neg_finally_franco_dutch_war_during_7_13_at_647(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_franco_dutch_war_during_7_13_aux().

