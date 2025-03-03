:- include('database.pl').
beslan_school_siege(Start,End) :- begin('beslan_school_siege',_,_,Start), end('beslan_school_siege',_,_,End), Start=<End.

compare_beslan_school_siege(Dir,beslan_school_siege(Start1,_),beslan_school_siege(Start2,_)) :- Start1=<Start2.

generate_neg_beslan_school_siege([]).

generate_neg_beslan_school_siege([(Start,End) | Tail]) :- assert(neg_beslan_school_siege(Start,End)), generate_neg_beslan_school_siege(Tail).

sort_beslan_school_siege(SortedIntervals) :- findall((Start,End),beslan_school_siege(Start,End),UnsortedIntervals), predsort(compare_beslan_school_siege,UnsortedIntervals,SortedIntervals).

generate_neg_beslan_school_siege_aux() :- sort_beslan_school_siege(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_beslan_school_siege(NegatedIntervals).

neg_beslan_school_siege_at_926(Res) :- setof((Start,End),neg_beslan_school_siege(Start,End),AllINtervals), checkvalidity(926,AllINtervals,Res).

check_query() :- write('Query = neg_beslan_school_siege_at_926'), (neg_beslan_school_siege_at_926(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_beslan_school_siege_aux().

