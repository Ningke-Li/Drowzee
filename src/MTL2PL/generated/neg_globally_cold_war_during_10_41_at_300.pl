:- include('database.pl').
cold_war(Start,End) :- begin('cold_war',_,_,Start), end('cold_war',_,_,End), Start=<End.

globally_cold_war_during_10_41(Start,End) :- cold_war(Start1,End1), Start is (Start1-10), End is (End1-41), Start=<End.

compare_globally_cold_war_during_10_41(Dir,globally_cold_war_during_10_41(Start1,_),globally_cold_war_during_10_41(Start2,_)) :- Start1=<Start2.

generate_neg_globally_cold_war_during_10_41([]).

generate_neg_globally_cold_war_during_10_41([(Start,End) | Tail]) :- assert(neg_globally_cold_war_during_10_41(Start,End)), generate_neg_globally_cold_war_during_10_41(Tail).

sort_globally_cold_war_during_10_41(SortedIntervals) :- findall((Start,End),globally_cold_war_during_10_41(Start,End),UnsortedIntervals), predsort(compare_globally_cold_war_during_10_41,UnsortedIntervals,SortedIntervals).

generate_neg_globally_cold_war_during_10_41_aux() :- sort_globally_cold_war_during_10_41(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_cold_war_during_10_41(NegatedIntervals).

neg_globally_cold_war_during_10_41_at_300(Res) :- setof((Start,End),neg_globally_cold_war_during_10_41(Start,End),AllINtervals), checkvalidity(300,AllINtervals,Res).

check_query() :- write('Query = neg_globally_cold_war_during_10_41_at_300'), (neg_globally_cold_war_during_10_41_at_300(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_cold_war_during_10_41_aux().

