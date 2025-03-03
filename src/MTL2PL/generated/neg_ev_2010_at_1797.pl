:- include('database.pl').
ev_2010(Start,End) :- begin('ev_2010',_,_,Start), end('ev_2010',_,_,End), Start=<End.

compare_ev_2010(Dir,ev_2010(Start1,_),ev_2010(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2010([]).

generate_neg_ev_2010([(Start,End) | Tail]) :- assert(neg_ev_2010(Start,End)), generate_neg_ev_2010(Tail).

sort_ev_2010(SortedIntervals) :- findall((Start,End),ev_2010(Start,End),UnsortedIntervals), predsort(compare_ev_2010,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2010_aux() :- sort_ev_2010(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2010(NegatedIntervals).

neg_ev_2010_at_1797(Res) :- setof((Start,End),neg_ev_2010(Start,End),AllINtervals), checkvalidity(1797,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2010_at_1797'), (neg_ev_2010_at_1797(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2010_aux().

