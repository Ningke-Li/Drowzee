:- include('database.pl').
ev_2006_lebanon_war(Start,End) :- begin('ev_2006_lebanon_war',_,_,Start), end('ev_2006_lebanon_war',_,_,End), Start=<End.

compare_ev_2006_lebanon_war(Dir,ev_2006_lebanon_war(Start1,_),ev_2006_lebanon_war(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2006_lebanon_war([]).

generate_neg_ev_2006_lebanon_war([(Start,End) | Tail]) :- assert(neg_ev_2006_lebanon_war(Start,End)), generate_neg_ev_2006_lebanon_war(Tail).

sort_ev_2006_lebanon_war(SortedIntervals) :- findall((Start,End),ev_2006_lebanon_war(Start,End),UnsortedIntervals), predsort(compare_ev_2006_lebanon_war,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2006_lebanon_war_aux() :- sort_ev_2006_lebanon_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2006_lebanon_war(NegatedIntervals).

neg_ev_2006_lebanon_war_at_398(Res) :- setof((Start,End),neg_ev_2006_lebanon_war(Start,End),AllINtervals), checkvalidity(398,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2006_lebanon_war_at_398'), (neg_ev_2006_lebanon_war_at_398(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2006_lebanon_war_aux().

