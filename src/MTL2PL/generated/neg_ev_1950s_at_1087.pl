:- include('database.pl').
ev_1950s(Start,End) :- begin('ev_1950s',_,_,Start), end('ev_1950s',_,_,End), Start=<End.

compare_ev_1950s(Dir,ev_1950s(Start1,_),ev_1950s(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1950s([]).

generate_neg_ev_1950s([(Start,End) | Tail]) :- assert(neg_ev_1950s(Start,End)), generate_neg_ev_1950s(Tail).

sort_ev_1950s(SortedIntervals) :- findall((Start,End),ev_1950s(Start,End),UnsortedIntervals), predsort(compare_ev_1950s,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1950s_aux() :- sort_ev_1950s(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1950s(NegatedIntervals).

neg_ev_1950s_at_1087(Res) :- setof((Start,End),neg_ev_1950s(Start,End),AllINtervals), checkvalidity(1087,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1950s_at_1087'), (neg_ev_1950s_at_1087(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1950s_aux().

