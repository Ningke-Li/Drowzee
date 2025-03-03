:- include('database.pl').
ev_2006_tour_de_france(Start,End) :- begin('ev_2006_tour_de_france',_,_,Start), end('ev_2006_tour_de_france',_,_,End), Start=<End.

compare_ev_2006_tour_de_france(Dir,ev_2006_tour_de_france(Start1,_),ev_2006_tour_de_france(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2006_tour_de_france([]).

generate_neg_ev_2006_tour_de_france([(Start,End) | Tail]) :- assert(neg_ev_2006_tour_de_france(Start,End)), generate_neg_ev_2006_tour_de_france(Tail).

sort_ev_2006_tour_de_france(SortedIntervals) :- findall((Start,End),ev_2006_tour_de_france(Start,End),UnsortedIntervals), predsort(compare_ev_2006_tour_de_france,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2006_tour_de_france_aux() :- sort_ev_2006_tour_de_france(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2006_tour_de_france(NegatedIntervals).

neg_ev_2006_tour_de_france_at_2016(Res) :- setof((Start,End),neg_ev_2006_tour_de_france(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2006_tour_de_france_at_2016'), (neg_ev_2006_tour_de_france_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2006_tour_de_france_aux().

