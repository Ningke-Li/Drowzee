:- include('database.pl').
ev_2016_kumamoto_earthquakes(Start,End) :- begin('ev_2016_kumamoto_earthquakes',_,_,Start), end('ev_2016_kumamoto_earthquakes',_,_,End), Start=<End.

compare_ev_2016_kumamoto_earthquakes(Dir,ev_2016_kumamoto_earthquakes(Start1,_),ev_2016_kumamoto_earthquakes(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2016_kumamoto_earthquakes([]).

generate_neg_ev_2016_kumamoto_earthquakes([(Start,End) | Tail]) :- assert(neg_ev_2016_kumamoto_earthquakes(Start,End)), generate_neg_ev_2016_kumamoto_earthquakes(Tail).

sort_ev_2016_kumamoto_earthquakes(SortedIntervals) :- findall((Start,End),ev_2016_kumamoto_earthquakes(Start,End),UnsortedIntervals), predsort(compare_ev_2016_kumamoto_earthquakes,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2016_kumamoto_earthquakes_aux() :- sort_ev_2016_kumamoto_earthquakes(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2016_kumamoto_earthquakes(NegatedIntervals).

neg_ev_2016_kumamoto_earthquakes_at_46(Res) :- setof((Start,End),neg_ev_2016_kumamoto_earthquakes(Start,End),AllINtervals), checkvalidity(46,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2016_kumamoto_earthquakes_at_46'), (neg_ev_2016_kumamoto_earthquakes_at_46(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2016_kumamoto_earthquakes_aux().

