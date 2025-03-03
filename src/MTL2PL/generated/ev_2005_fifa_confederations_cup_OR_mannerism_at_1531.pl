:- include('database.pl').
ev_2005_fifa_confederations_cup(Start,End) :- begin('ev_2005_fifa_confederations_cup',_,_,Start), end('ev_2005_fifa_confederations_cup',_,_,End), Start=<End.

mannerism(Start,End) :- begin('mannerism',_,_,Start), end('mannerism',_,_,End), Start=<End.

generate_facts_ev_2005_fifa_confederations_cup_OR_mannerism([]) :- assert(ev_2005_fifa_confederations_cup_OR_mannerism(-1,-1)).

generate_facts_ev_2005_fifa_confederations_cup_OR_mannerism([(Start,End) | Tail]) :- assert(ev_2005_fifa_confederations_cup_OR_mannerism(Start,End)), generate_facts_ev_2005_fifa_confederations_cup_OR_mannerism(Tail).

ev_2005_fifa_confederations_cup_OR_mannerism_aux() :- findall((Start,End),ev_2005_fifa_confederations_cup(Start,End),Interval1), findall((Start,End),mannerism(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2005_fifa_confederations_cup_OR_mannerism(Interval).

ev_2005_fifa_confederations_cup_OR_mannerism_at_1531(Res) :- setof((Start,End),ev_2005_fifa_confederations_cup_OR_mannerism(Start,End),AllINtervals), checkvalidity(1531,AllINtervals,Res).

check_query() :- write('Query = ev_2005_fifa_confederations_cup_OR_mannerism_at_1531'), (ev_2005_fifa_confederations_cup_OR_mannerism_at_1531(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2005_fifa_confederations_cup_OR_mannerism_aux().

