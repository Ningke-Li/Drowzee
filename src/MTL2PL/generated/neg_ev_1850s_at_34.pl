:- include('database.pl').
ev_1850s(Start,End) :- begin('ev_1850s',_,_,Start), end('ev_1850s',_,_,End), Start=<End.

compare_ev_1850s(Dir,ev_1850s(Start1,_),ev_1850s(Start2,_)) :- Start1=<Start2.

generate_neg_ev_1850s([]).

generate_neg_ev_1850s([(Start,End) | Tail]) :- assert(neg_ev_1850s(Start,End)), generate_neg_ev_1850s(Tail).

sort_ev_1850s(SortedIntervals) :- findall((Start,End),ev_1850s(Start,End),UnsortedIntervals), predsort(compare_ev_1850s,UnsortedIntervals,SortedIntervals).

generate_neg_ev_1850s_aux() :- sort_ev_1850s(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_1850s(NegatedIntervals).

neg_ev_1850s_at_34(Res) :- setof((Start,End),neg_ev_1850s(Start,End),AllINtervals), checkvalidity(34,AllINtervals,Res).

check_query() :- write('Query = neg_ev_1850s_at_34'), (neg_ev_1850s_at_34(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_1850s_aux().

