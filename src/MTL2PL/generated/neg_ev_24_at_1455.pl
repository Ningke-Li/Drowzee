:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

compare_ev_24(Dir,ev_24(Start1,_),ev_24(Start2,_)) :- Start1=<Start2.

generate_neg_ev_24([]).

generate_neg_ev_24([(Start,End) | Tail]) :- assert(neg_ev_24(Start,End)), generate_neg_ev_24(Tail).

sort_ev_24(SortedIntervals) :- findall((Start,End),ev_24(Start,End),UnsortedIntervals), predsort(compare_ev_24,UnsortedIntervals,SortedIntervals).

generate_neg_ev_24_aux() :- sort_ev_24(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_24(NegatedIntervals).

neg_ev_24_at_1455(Res) :- setof((Start,End),neg_ev_24(Start,End),AllINtervals), checkvalidity(1455,AllINtervals,Res).

check_query() :- write('Query = neg_ev_24_at_1455'), (neg_ev_24_at_1455(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_24_aux().

