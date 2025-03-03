:- include('database.pl').
ev_2010_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2010_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

compare_ev_2010_fifa_world_cup_qualification__conmebol_(Dir,ev_2010_fifa_world_cup_qualification__conmebol_(Start1,_),ev_2010_fifa_world_cup_qualification__conmebol_(Start2,_)) :- Start1=<Start2.

generate_neg_ev_2010_fifa_world_cup_qualification__conmebol_([]).

generate_neg_ev_2010_fifa_world_cup_qualification__conmebol_([(Start,End) | Tail]) :- assert(neg_ev_2010_fifa_world_cup_qualification__conmebol_(Start,End)), generate_neg_ev_2010_fifa_world_cup_qualification__conmebol_(Tail).

sort_ev_2010_fifa_world_cup_qualification__conmebol_(SortedIntervals) :- findall((Start,End),ev_2010_fifa_world_cup_qualification__conmebol_(Start,End),UnsortedIntervals), predsort(compare_ev_2010_fifa_world_cup_qualification__conmebol_,UnsortedIntervals,SortedIntervals).

generate_neg_ev_2010_fifa_world_cup_qualification__conmebol__aux() :- sort_ev_2010_fifa_world_cup_qualification__conmebol_(SortedIntervals), compute_negatedintervals(0,SortedIntervals,NegatedIntervals), generate_neg_ev_2010_fifa_world_cup_qualification__conmebol_(NegatedIntervals).

neg_ev_2010_fifa_world_cup_qualification__conmebol__at_1549(Res) :- setof((Start,End),neg_ev_2010_fifa_world_cup_qualification__conmebol_(Start,End),AllINtervals), checkvalidity(1549,AllINtervals,Res).

check_query() :- write('Query = neg_ev_2010_fifa_world_cup_qualification__conmebol__at_1549'), (neg_ev_2010_fifa_world_cup_qualification__conmebol__at_1549(true) -> write('\nRes   = true');write('\nRes   = false')).
?- generate_neg_ev_2010_fifa_world_cup_qualification__conmebol__aux().

