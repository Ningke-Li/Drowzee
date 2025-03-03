:- include('database.pl').
ev_2006_africa_cup_of_nations(Start,End) :- begin('ev_2006_africa_cup_of_nations',_,_,Start), end('ev_2006_africa_cup_of_nations',_,_,End), Start=<End.

compare_ev_2006_africa_cup_of_nations(Dir,ev_2006_africa_cup_of_nations(Start1,_),ev_2006_africa_cup_of_nations(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2006_africa_cup_of_nations([]).

generate_neg_ev_2006_africa_cup_of_nations([(Start,End) | Tail]) :- assert(neg_ev_2006_africa_cup_of_nations(Start,End)), generate_neg_ev_2006_africa_cup_of_nations(Tail).

sort_ev_2006_africa_cup_of_nations(SortedIntervals) :- findall((Start,End),ev_2006_africa_cup_of_nations(Start,End),UnsortedIntervals), predsort(compare_ev_2006_africa_cup_of_nations,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2006_africa_cup_of_nations_aux() :- sort_ev_2006_africa_cup_of_nations(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2006_africa_cup_of_nations(NegatedIntervals).

neg_ev_2006_africa_cup_of_nations_at_1769(Res) :- setof((Start,End),neg_ev_2006_africa_cup_of_nations(Start,End),AllINtervals), checkvalidity(1769,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2006_africa_cup_of_nations_at_1769'), (neg_ev_2006_africa_cup_of_nations_at_1769(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2006_africa_cup_of_nations_aux().

