:- include('database.pl').
ev_1400s(Start,End) :- begin('ev_1400s',_,_,Start), end('ev_1400s',_,_,End), Start=<End.

compare_ev_1400s(Dir,ev_1400s(Start1,_),ev_1400s(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1400s([]).

generate_neg_ev_1400s([(Start,End) | Tail]) :- assert(neg_ev_1400s(Start,End)), generate_neg_ev_1400s(Tail).

sort_ev_1400s(SortedIntervals) :- findall((Start,End),ev_1400s(Start,End),UnsortedIntervals), predsort(compare_ev_1400s,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1400s_aux() :- sort_ev_1400s(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1400s(NegatedIntervals).

neg_ev_1400s_at_1180(Res) :- setof((Start,End),neg_ev_1400s(Start,End),AllINtervals), checkvalidity(1180,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1400s_at_1180'), (neg_ev_1400s_at_1180(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1400s_aux().

