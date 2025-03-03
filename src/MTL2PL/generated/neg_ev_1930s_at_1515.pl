:- include('database.pl').
ev_1930s(Start,End) :- begin('ev_1930s',_,_,Start), end('ev_1930s',_,_,End), Start=<End.

compare_ev_1930s(Dir,ev_1930s(Start1,_),ev_1930s(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1930s([]).

generate_neg_ev_1930s([(Start,End) | Tail]) :- assert(neg_ev_1930s(Start,End)), generate_neg_ev_1930s(Tail).

sort_ev_1930s(SortedIntervals) :- findall((Start,End),ev_1930s(Start,End),UnsortedIntervals), predsort(compare_ev_1930s,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1930s_aux() :- sort_ev_1930s(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1930s(NegatedIntervals).

neg_ev_1930s_at_1515(Res) :- setof((Start,End),neg_ev_1930s(Start,End),AllINtervals), checkvalidity(1515,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1930s_at_1515'), (neg_ev_1930s_at_1515(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1930s_aux().

