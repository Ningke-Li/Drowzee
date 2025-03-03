:- include('database.pl').
ev__nin_war(Start,End) :- begin('ev__nin_war',_,_,Start), end('ev__nin_war',_,_,End), Start=<End.

globally_ev__nin_war_during_3_8(Start,End) :- ev__nin_war(Start1,End1), Start is (Start1-3), End is (End1-8), Start=<End.

compare_globally_ev__nin_war_during_3_8(Dir,globally_ev__nin_war_during_3_8(Start1,_),globally_ev__nin_war_during_3_8(Start2,_)) :- Start1=<Start2.

generate_neg_globally_ev__nin_war_during_3_8([]).

generate_neg_globally_ev__nin_war_during_3_8([(Start,End) | Tail]) :- assert(neg_globally_ev__nin_war_during_3_8(Start,End)), generate_neg_globally_ev__nin_war_during_3_8(Tail).

sort_globally_ev__nin_war_during_3_8(SortedIntervals) :- findall((Start,End),globally_ev__nin_war_during_3_8(Start,End),UnsortedIntervals), predsort(compare_globally_ev__nin_war_during_3_8,UnsortedIntervals,SortedIntervals).

generate_neg_globally_ev__nin_war_during_3_8_aux() :- sort_globally_ev__nin_war_during_3_8(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_globally_ev__nin_war_during_3_8(NegatedIntervals).

neg_globally_ev__nin_war_during_3_8_at_1345(Res) :- setof((Start,End),neg_globally_ev__nin_war_during_3_8(Start,End),AllINtervals), checkvalidity(1345,AllINtervals,Res).

check_query() :- write('Query = neg_globally_ev__nin_war_during_3_8_at_1345'), (neg_globally_ev__nin_war_during_3_8_at_1345(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_globally_ev__nin_war_during_3_8_aux().

