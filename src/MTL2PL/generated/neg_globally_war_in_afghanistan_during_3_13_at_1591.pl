:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

globally_war_in_afghanistan_during_3_13(Start,End) :- war_in_afghanistan(Start1,End1), Start is (Start1-3), End is (End1-13), Start=<End.

compare_globally_war_in_afghanistan_during_3_13(Dir,globally_war_in_afghanistan_during_3_13(Start1,_),globally_war_in_afghanistan_during_3_13(Start2,_)) :- Start1=<Start2.

generate_neg_globally_war_in_afghanistan_during_3_13([]).

generate_neg_globally_war_in_afghanistan_during_3_13([(Start,End) | Tail]) :- assert(neg_globally_war_in_afghanistan_during_3_13(Start,End)), generate_neg_globally_war_in_afghanistan_during_3_13(Tail).

sort_globally_war_in_afghanistan_during_3_13(SortedIntervals) :- findall((Start,End),globally_war_in_afghanistan_during_3_13(Start,End),UnsortedIntervals), predsort(compare_globally_war_in_afghanistan_during_3_13,UnsortedIntervals,SortedIntervals).

generate_neg_globally_war_in_afghanistan_during_3_13_aux() :- sort_globally_war_in_afghanistan_during_3_13(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_war_in_afghanistan_during_3_13(NegatedIntervals).

neg_globally_war_in_afghanistan_during_3_13_at_1591(Res) :- setof((Start,End),neg_globally_war_in_afghanistan_during_3_13(Start,End),AllINtervals), checkvalidity(1591,AllINtervals,Res).

check_query() :- write('Query = neg_globally_war_in_afghanistan_during_3_13_at_1591'), (neg_globally_war_in_afghanistan_during_3_13_at_1591(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_war_in_afghanistan_during_3_13_aux().

