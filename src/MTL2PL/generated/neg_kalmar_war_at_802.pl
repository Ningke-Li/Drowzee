:- include('database.pl').
kalmar_war(Start,End) :- begin('kalmar_war',_,_,Start), end('kalmar_war',_,_,End), Start=<End.

compare_kalmar_war(Dir,kalmar_war(Start1,_),kalmar_war(Start2,_)) :- Start1=<Start2.

generate_neg_kalmar_war([]).

generate_neg_kalmar_war([(Start,End) | Tail]) :- assert(neg_kalmar_war(Start,End)), generate_neg_kalmar_war(Tail).

sort_kalmar_war(SortedIntervals) :- findall((Start,End),kalmar_war(Start,End),UnsortedIntervals), predsort(compare_kalmar_war,UnsortedIntervals,SortedIntervals).

generate_neg_kalmar_war_aux() :- sort_kalmar_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_kalmar_war(NegatedIntervals).

neg_kalmar_war_at_802(Res) :- setof((Start,End),neg_kalmar_war(Start,End),AllINtervals), checkvalidity(802,AllINtervals,Res).

check_query() :- write('Query = neg_kalmar_war_at_802'), (neg_kalmar_war_at_802(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_kalmar_war_aux().

