:- include('database.pl').
ev_2015_afc_asian_cup(Start,End) :- begin('ev_2015_afc_asian_cup',_,_,Start), end('ev_2015_afc_asian_cup',_,_,End), Start=<End.

ev_2001_fifa_confederations_cup(Start,End) :- begin('ev_2001_fifa_confederations_cup',_,_,Start), end('ev_2001_fifa_confederations_cup',_,_,End), Start=<End.

generate_facts_ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup([]) :- assert(ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup(-1,-1)).

generate_facts_ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup([(Start,End) | Tail]) :- assert(ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup(Start,End)), generate_facts_ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup(Tail).

ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup_aux() :- findall((Start,End),ev_2015_afc_asian_cup(Start,End),Interval1), findall((Start,End),ev_2001_fifa_confederations_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup(Interval).

ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup_at_1910(Res) :- setof((Start,End),ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup_at_1910'), (ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_afc_asian_cup_OR_ev_2001_fifa_confederations_cup_aux().

