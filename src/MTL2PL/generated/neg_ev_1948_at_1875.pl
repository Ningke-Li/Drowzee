:- include('database.pl').
ev_1948(Start,End) :- begin('ev_1948',_,_,Start), end('ev_1948',_,_,End), Start=<End.

compare_ev_1948(Dir,ev_1948(Start1,_),ev_1948(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1948([]).

generate_neg_ev_1948([(Start,End) | Tail]) :- assert(neg_ev_1948(Start,End)), generate_neg_ev_1948(Tail).

sort_ev_1948(SortedIntervals) :- findall((Start,End),ev_1948(Start,End),UnsortedIntervals), predsort(compare_ev_1948,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1948_aux() :- sort_ev_1948(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1948(NegatedIntervals).

neg_ev_1948_at_1875(Res) :- setof((Start,End),neg_ev_1948(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1948_at_1875'), (neg_ev_1948_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1948_aux().

