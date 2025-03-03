:- include('database.pl').
spanish_american_war(Start,End) :- begin('spanish_american_war',_,_,Start), end('spanish_american_war',_,_,End), Start=<End.

compare_spanish_american_war(Dir,spanish_american_war(Start1,_),spanish_american_war(Start2,_)) :- Start1=<Start2.

generate_neg_spanish_american_war([]).

generate_neg_spanish_american_war([(Start,End) | Tail]) :- assert(neg_spanish_american_war(Start,End)), generate_neg_spanish_american_war(Tail).

sort_spanish_american_war(SortedIntervals) :- findall((Start,End),spanish_american_war(Start,End),UnsortedIntervals), predsort(compare_spanish_american_war,UnsortedIntervals,SortedIntervals).

generate_neg_spanish_american_war_aux() :- sort_spanish_american_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_spanish_american_war(NegatedIntervals).

neg_spanish_american_war_at_1319(Res) :- setof((Start,End),neg_spanish_american_war(Start,End),AllINtervals), checkvalidity(1319,AllINtervals,Res).

check_query() :- write('Query = neg_spanish_american_war_at_1319'), (neg_spanish_american_war_at_1319(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_spanish_american_war_aux().

