:- include('database.pl').
spanish_civil_war(Start,End) :- begin('spanish_civil_war',_,_,Start), end('spanish_civil_war',_,_,End), Start=<End.

compare_spanish_civil_war(Dir,spanish_civil_war(Start1,_),spanish_civil_war(Start2,_)) :- Start1=<Start2.

generate_neg_spanish_civil_war([]).

generate_neg_spanish_civil_war([(Start,End) | Tail]) :- assert(neg_spanish_civil_war(Start,End)), generate_neg_spanish_civil_war(Tail).

sort_spanish_civil_war(SortedIntervals) :- findall((Start,End),spanish_civil_war(Start,End),UnsortedIntervals), predsort(compare_spanish_civil_war,UnsortedIntervals,SortedIntervals).

generate_neg_spanish_civil_war_aux() :- sort_spanish_civil_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_spanish_civil_war(NegatedIntervals).

neg_spanish_civil_war_at_2026(Res) :- setof((Start,End),neg_spanish_civil_war(Start,End),AllINtervals), checkvalidity(2026,AllINtervals,Res).

check_query() :- write('Query = neg_spanish_civil_war_at_2026'), (neg_spanish_civil_war_at_2026(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_spanish_civil_war_aux().

