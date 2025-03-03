:- include('database.pl').
phoney_war(Start,End) :- begin('phoney_war',_,_,Start), end('phoney_war',_,_,End), Start=<End.

globally_phoney_war_during_7_17(Start,End) :- phoney_war(Start1,End1), Start is (Start1-7), End is (End1-17), Start=<End.

compare_globally_phoney_war_during_7_17(Dir,globally_phoney_war_during_7_17(Start1,_),globally_phoney_war_during_7_17(Start2,_)) :- Start1=<Start2.

generate_neg_globally_phoney_war_during_7_17([]).

generate_neg_globally_phoney_war_during_7_17([(Start,End) | Tail]) :- assert(neg_globally_phoney_war_during_7_17(Start,End)), generate_neg_globally_phoney_war_during_7_17(Tail).

sort_globally_phoney_war_during_7_17(SortedIntervals) :- findall((Start,End),globally_phoney_war_during_7_17(Start,End),UnsortedIntervals), predsort(compare_globally_phoney_war_during_7_17,UnsortedIntervals,SortedIntervals).

generate_neg_globally_phoney_war_during_7_17_aux() :- sort_globally_phoney_war_during_7_17(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_phoney_war_during_7_17(NegatedIntervals).

neg_globally_phoney_war_during_7_17_at_1137(Res) :- setof((Start,End),neg_globally_phoney_war_during_7_17(Start,End),AllINtervals), checkvalidity(1137,AllINtervals,Res).

check_query() :- write('Query = neg_globally_phoney_war_during_7_17_at_1137'), (neg_globally_phoney_war_during_7_17_at_1137(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_phoney_war_during_7_17_aux().

