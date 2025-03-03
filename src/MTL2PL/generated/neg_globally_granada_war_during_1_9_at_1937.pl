:- include('database.pl').
granada_war(Start,End) :- begin('granada_war',_,_,Start), end('granada_war',_,_,End), Start=<End.

globally_granada_war_during_1_9(Start,End) :- granada_war(Start1,End1), Start is (Start1-1), End is (End1-9), Start=<End.

compare_globally_granada_war_during_1_9(Dir,globally_granada_war_during_1_9(Start1,_),globally_granada_war_during_1_9(Start2,_)) :- Start1=<Start2.

generate_neg_globally_granada_war_during_1_9([]).

generate_neg_globally_granada_war_during_1_9([(Start,End) | Tail]) :- assert(neg_globally_granada_war_during_1_9(Start,End)), generate_neg_globally_granada_war_during_1_9(Tail).

sort_globally_granada_war_during_1_9(SortedIntervals) :- findall((Start,End),globally_granada_war_during_1_9(Start,End),UnsortedIntervals), predsort(compare_globally_granada_war_during_1_9,UnsortedIntervals,SortedIntervals).

generate_neg_globally_granada_war_during_1_9_aux() :- sort_globally_granada_war_during_1_9(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_granada_war_during_1_9(NegatedIntervals).

neg_globally_granada_war_during_1_9_at_1937(Res) :- setof((Start,End),neg_globally_granada_war_during_1_9(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = neg_globally_granada_war_during_1_9_at_1937'), (neg_globally_granada_war_during_1_9_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_granada_war_during_1_9_aux().

