:- include('database.pl').
ev_2001_world_championships_in_athletics(Start,End) :- begin('ev_2001_world_championships_in_athletics',_,_,Start), end('ev_2001_world_championships_in_athletics',_,_,End), Start=<End.

compare_ev_2001_world_championships_in_athletics(Dir,ev_2001_world_championships_in_athletics(Start1,_),ev_2001_world_championships_in_athletics(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2001_world_championships_in_athletics([]).

generate_neg_ev_2001_world_championships_in_athletics([(Start,End) | Tail]) :- assert(neg_ev_2001_world_championships_in_athletics(Start,End)), generate_neg_ev_2001_world_championships_in_athletics(Tail).

sort_ev_2001_world_championships_in_athletics(SortedIntervals) :- findall((Start,End),ev_2001_world_championships_in_athletics(Start,End),UnsortedIntervals), predsort(compare_ev_2001_world_championships_in_athletics,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2001_world_championships_in_athletics_aux() :- sort_ev_2001_world_championships_in_athletics(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2001_world_championships_in_athletics(NegatedIntervals).

neg_ev_2001_world_championships_in_athletics_at_1716(Res) :- setof((Start,End),neg_ev_2001_world_championships_in_athletics(Start,End),AllINtervals), checkvalidity(1716,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2001_world_championships_in_athletics_at_1716'), (neg_ev_2001_world_championships_in_athletics_at_1716(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2001_world_championships_in_athletics_aux().

