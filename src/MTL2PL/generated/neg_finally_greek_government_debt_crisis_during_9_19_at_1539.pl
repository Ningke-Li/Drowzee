:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

finally_greek_government_debt_crisis_during_9_19(Start,End) :- greek_government_debt_crisis(Start1,End1), (Start1-19)=<(End1-9), Start is (Start1-19), End is (End1-9), Start=<End.

compare_finally_greek_government_debt_crisis_during_9_19(Dir,finally_greek_government_debt_crisis_during_9_19(Start1,_),finally_greek_government_debt_crisis_during_9_19(Start2,_)) :- Start1=<Start2.

generate_neg_finally_greek_government_debt_crisis_during_9_19([]).

generate_neg_finally_greek_government_debt_crisis_during_9_19([(Start,End) | Tail]) :- assert(neg_finally_greek_government_debt_crisis_during_9_19(Start,End)), generate_neg_finally_greek_government_debt_crisis_during_9_19(Tail).

sort_finally_greek_government_debt_crisis_during_9_19(SortedIntervals) :- findall((Start,End),finally_greek_government_debt_crisis_during_9_19(Start,End),UnsortedIntervals), predsort(compare_finally_greek_government_debt_crisis_during_9_19,UnsortedIntervals,SortedIntervals).

generate_neg_finally_greek_government_debt_crisis_during_9_19_aux() :- sort_finally_greek_government_debt_crisis_during_9_19(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_finally_greek_government_debt_crisis_during_9_19(NegatedIntervals).

neg_finally_greek_government_debt_crisis_during_9_19_at_1539(Res) :- setof((Start,End),neg_finally_greek_government_debt_crisis_during_9_19(Start,End),AllINtervals), checkvalidity(1539,AllINtervals,Res).

check_query() :- write('Query = neg_finally_greek_government_debt_crisis_during_9_19_at_1539'), (neg_finally_greek_government_debt_crisis_during_9_19_at_1539(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_finally_greek_government_debt_crisis_during_9_19_aux().

