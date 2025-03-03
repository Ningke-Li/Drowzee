:- include('database.pl').
ev_2011(Start,End) :- begin('ev_2011',_,_,Start), end('ev_2011',_,_,End), Start=<End.

compare_ev_2011(Dir,ev_2011(Start1,_),ev_2011(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2011([]).

generate_neg_ev_2011([(Start,End) | Tail]) :- assert(neg_ev_2011(Start,End)), generate_neg_ev_2011(Tail).

sort_ev_2011(SortedIntervals) :- findall((Start,End),ev_2011(Start,End),UnsortedIntervals), predsort(compare_ev_2011,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2011_aux() :- sort_ev_2011(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2011(NegatedIntervals).

neg_ev_2011_at_833(Res) :- setof((Start,End),neg_ev_2011(Start,End),AllINtervals), checkvalidity(833,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2011_at_833'), (neg_ev_2011_at_833(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2011_aux().

