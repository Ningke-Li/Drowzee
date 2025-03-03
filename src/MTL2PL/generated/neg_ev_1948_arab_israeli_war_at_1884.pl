:- include('database.pl').
ev_1948_arab_israeli_war(Start,End) :- begin('ev_1948_arab_israeli_war',_,_,Start), end('ev_1948_arab_israeli_war',_,_,End), Start=<End.

compare_ev_1948_arab_israeli_war(Dir,ev_1948_arab_israeli_war(Start1,_),ev_1948_arab_israeli_war(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1948_arab_israeli_war([]).

generate_neg_ev_1948_arab_israeli_war([(Start,End) | Tail]) :- assert(neg_ev_1948_arab_israeli_war(Start,End)), generate_neg_ev_1948_arab_israeli_war(Tail).

sort_ev_1948_arab_israeli_war(SortedIntervals) :- findall((Start,End),ev_1948_arab_israeli_war(Start,End),UnsortedIntervals), predsort(compare_ev_1948_arab_israeli_war,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1948_arab_israeli_war_aux() :- sort_ev_1948_arab_israeli_war(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1948_arab_israeli_war(NegatedIntervals).

neg_ev_1948_arab_israeli_war_at_1884(Res) :- setof((Start,End),neg_ev_1948_arab_israeli_war(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1948_arab_israeli_war_at_1884'), (neg_ev_1948_arab_israeli_war_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1948_arab_israeli_war_aux().

