:- include('database.pl').
ev_2009(Start,End) :- begin('ev_2009',_,_,Start), end('ev_2009',_,_,End), Start=<End.

compare_ev_2009(Dir,ev_2009(Start1,_),ev_2009(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2009([]).

generate_neg_ev_2009([(Start,End) | Tail]) :- assert(neg_ev_2009(Start,End)), generate_neg_ev_2009(Tail).

sort_ev_2009(SortedIntervals) :- findall((Start,End),ev_2009(Start,End),UnsortedIntervals), predsort(compare_ev_2009,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2009_aux() :- sort_ev_2009(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2009(NegatedIntervals).

neg_ev_2009_at_1044(Res) :- setof((Start,End),neg_ev_2009(Start,End),AllINtervals), checkvalidity(1044,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2009_at_1044'), (neg_ev_2009_at_1044(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2009_aux().

