:- include('database.pl').
ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

compare_ev_2012_13_la_liga(Dir,ev_2012_13_la_liga(Start1,_),ev_2012_13_la_liga(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2012_13_la_liga([]).

generate_neg_ev_2012_13_la_liga([(Start,End) | Tail]) :- assert(neg_ev_2012_13_la_liga(Start,End)), generate_neg_ev_2012_13_la_liga(Tail).

sort_ev_2012_13_la_liga(SortedIntervals) :- findall((Start,End),ev_2012_13_la_liga(Start,End),UnsortedIntervals), predsort(compare_ev_2012_13_la_liga,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2012_13_la_liga_aux() :- sort_ev_2012_13_la_liga(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2012_13_la_liga(NegatedIntervals).

neg_ev_2012_13_la_liga_at_1459(Res) :- setof((Start,End),neg_ev_2012_13_la_liga(Start,End),AllINtervals), checkvalidity(1459,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2012_13_la_liga_at_1459'), (neg_ev_2012_13_la_liga_at_1459(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2012_13_la_liga_aux().

