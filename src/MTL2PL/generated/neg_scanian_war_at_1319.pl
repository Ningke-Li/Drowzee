:- include('database.pl').
scanian_war(Start,End) :- begin('scanian_war',_,_,Start), end('scanian_war',_,_,End), Start=<End.

compare_scanian_war(Dir,scanian_war(Start1,_),scanian_war(Start2,_)) :- Start1=<Start2.

generate_neg_scanian_war([]).

generate_neg_scanian_war([(Start,End) | Tail]) :- assert(neg_scanian_war(Start,End)), generate_neg_scanian_war(Tail).

sort_scanian_war(SortedIntervals) :- findall((Start,End),scanian_war(Start,End),UnsortedIntervals), predsort(compare_scanian_war,UnsortedIntervals,SortedIntervals).

generate_neg_scanian_war_aux() :- sort_scanian_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_scanian_war(NegatedIntervals).

neg_scanian_war_at_1319(Res) :- setof((Start,End),neg_scanian_war(Start,End),AllINtervals), checkvalidity(1319,AllINtervals,Res).

check_query() :- write('Query = neg_scanian_war_at_1319'), (neg_scanian_war_at_1319(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_scanian_war_aux().

