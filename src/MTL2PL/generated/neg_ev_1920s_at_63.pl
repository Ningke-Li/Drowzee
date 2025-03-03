:- include('database.pl').
ev_1920s(Start,End) :- begin('ev_1920s',_,_,Start), end('ev_1920s',_,_,End), Start=<End.

compare_ev_1920s(Dir,ev_1920s(Start1,_),ev_1920s(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1920s([]).

generate_neg_ev_1920s([(Start,End) | Tail]) :- assert(neg_ev_1920s(Start,End)), generate_neg_ev_1920s(Tail).

sort_ev_1920s(SortedIntervals) :- findall((Start,End),ev_1920s(Start,End),UnsortedIntervals), predsort(compare_ev_1920s,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1920s_aux() :- sort_ev_1920s(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1920s(NegatedIntervals).

neg_ev_1920s_at_63(Res) :- setof((Start,End),neg_ev_1920s(Start,End),AllINtervals), checkvalidity(63,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1920s_at_63'), (neg_ev_1920s_at_63(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1920s_aux().

