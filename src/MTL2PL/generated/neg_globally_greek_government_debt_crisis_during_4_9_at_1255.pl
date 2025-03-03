:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

globally_greek_government_debt_crisis_during_4_9(Start,End) :- greek_government_debt_crisis(Start1,End1), Start is (Start1-4), End is (End1-9), Start=<End.

compare_globally_greek_government_debt_crisis_during_4_9(Dir,globally_greek_government_debt_crisis_during_4_9(Start1,_),globally_greek_government_debt_crisis_during_4_9(Start2,_)) :- Start1=<Start2.

generate_neg_globally_greek_government_debt_crisis_during_4_9([]).

generate_neg_globally_greek_government_debt_crisis_during_4_9([(Start,End) | Tail]) :- assert(neg_globally_greek_government_debt_crisis_during_4_9(Start,End)), generate_neg_globally_greek_government_debt_crisis_during_4_9(Tail).

sort_globally_greek_government_debt_crisis_during_4_9(SortedIntervals) :- findall((Start,End),globally_greek_government_debt_crisis_during_4_9(Start,End),UnsortedIntervals), predsort(compare_globally_greek_government_debt_crisis_during_4_9,UnsortedIntervals,SortedIntervals).

generate_neg_globally_greek_government_debt_crisis_during_4_9_aux() :- sort_globally_greek_government_debt_crisis_during_4_9(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_greek_government_debt_crisis_during_4_9(NegatedIntervals).

neg_globally_greek_government_debt_crisis_during_4_9_at_1255(Res) :- setof((Start,End),neg_globally_greek_government_debt_crisis_during_4_9(Start,End),AllINtervals), checkvalidity(1255,AllINtervals,Res).

check_query() :- write('Query = neg_globally_greek_government_debt_crisis_during_4_9_at_1255'), (neg_globally_greek_government_debt_crisis_during_4_9_at_1255(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_greek_government_debt_crisis_during_4_9_aux().

