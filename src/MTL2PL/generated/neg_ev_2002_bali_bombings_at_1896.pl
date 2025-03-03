:- include('database.pl').
ev_2002_bali_bombings(Start,End) :- begin('ev_2002_bali_bombings',_,_,Start), end('ev_2002_bali_bombings',_,_,End), Start=<End.

compare_ev_2002_bali_bombings(Dir,ev_2002_bali_bombings(Start1,_),ev_2002_bali_bombings(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2002_bali_bombings([]).

generate_neg_ev_2002_bali_bombings([(Start,End) | Tail]) :- assert(neg_ev_2002_bali_bombings(Start,End)), generate_neg_ev_2002_bali_bombings(Tail).

sort_ev_2002_bali_bombings(SortedIntervals) :- findall((Start,End),ev_2002_bali_bombings(Start,End),UnsortedIntervals), predsort(compare_ev_2002_bali_bombings,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2002_bali_bombings_aux() :- sort_ev_2002_bali_bombings(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2002_bali_bombings(NegatedIntervals).

neg_ev_2002_bali_bombings_at_1896(Res) :- setof((Start,End),neg_ev_2002_bali_bombings(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2002_bali_bombings_at_1896'), (neg_ev_2002_bali_bombings_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2002_bali_bombings_aux().

