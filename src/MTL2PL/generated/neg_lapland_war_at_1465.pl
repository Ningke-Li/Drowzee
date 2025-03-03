:- include('database.pl').
lapland_war(Start,End) :- begin('lapland_war',_,_,Start), end('lapland_war',_,_,End), Start=<End.

compare_lapland_war(Dir,lapland_war(Start1,_),lapland_war(Start2,_)) :- Start1=<Start2.

generate_neg_lapland_war([]).

generate_neg_lapland_war([(Start,End) | Tail]) :- assert(neg_lapland_war(Start,End)), generate_neg_lapland_war(Tail).

sort_lapland_war(SortedIntervals) :- findall((Start,End),lapland_war(Start,End),UnsortedIntervals), predsort(compare_lapland_war,UnsortedIntervals,SortedIntervals).

generate_neg_lapland_war_aux() :- sort_lapland_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_lapland_war(NegatedIntervals).

neg_lapland_war_at_1465(Res) :- setof((Start,End),neg_lapland_war(Start,End),AllINtervals), checkvalidity(1465,AllINtervals,Res).

check_query() :- write('Query = neg_lapland_war_at_1465'), (neg_lapland_war_at_1465(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_lapland_war_aux().

