:- include('database.pl').
greek_war_of_independence(Start,End) :- begin('greek_war_of_independence',_,_,Start), end('greek_war_of_independence',_,_,End), Start=<End.

compare_greek_war_of_independence(Dir,greek_war_of_independence(Start1,_),greek_war_of_independence(Start2,_)) :- Start1=<Start2.

generate_neg_greek_war_of_independence([]).

generate_neg_greek_war_of_independence([(Start,End) | Tail]) :- assert(neg_greek_war_of_independence(Start,End)), generate_neg_greek_war_of_independence(Tail).

sort_greek_war_of_independence(SortedIntervals) :- findall((Start,End),greek_war_of_independence(Start,End),UnsortedIntervals), predsort(compare_greek_war_of_independence,UnsortedIntervals,SortedIntervals).

generate_neg_greek_war_of_independence_aux() :- sort_greek_war_of_independence(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_greek_war_of_independence(NegatedIntervals).

neg_greek_war_of_independence_at_642(Res) :- setof((Start,End),neg_greek_war_of_independence(Start,End),AllINtervals), checkvalidity(642,AllINtervals,Res).

check_query() :- write('Query = neg_greek_war_of_independence_at_642'), (neg_greek_war_of_independence_at_642(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_greek_war_of_independence_aux().

