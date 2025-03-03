:- include('database.pl').
ev_2006_fifa_world_cup_qualification(Start,End) :- begin('ev_2006_fifa_world_cup_qualification',_,_,Start), end('ev_2006_fifa_world_cup_qualification',_,_,End), Start=<End.

boston_legal(Start,End) :- begin('boston_legal',_,_,Start), end('boston_legal',_,_,End), Start=<End.

generate_facts_ev_2006_fifa_world_cup_qualification_AND_boston_legal([]) :- assert(ev_2006_fifa_world_cup_qualification_AND_boston_legal(-1,-1)).

generate_facts_ev_2006_fifa_world_cup_qualification_AND_boston_legal([(Start,End) | Tail]) :- assert(ev_2006_fifa_world_cup_qualification_AND_boston_legal(Start,End)), generate_facts_ev_2006_fifa_world_cup_qualification_AND_boston_legal(Tail).

ev_2006_fifa_world_cup_qualification_AND_boston_legal_aux() :- findall((Start,End),ev_2006_fifa_world_cup_qualification(Start,End),Interval1), findall((Start,End),boston_legal(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2006_fifa_world_cup_qualification_AND_boston_legal(Interval).

ev_2006_fifa_world_cup_qualification_AND_boston_legal_at_1934(Res) :- setof((Start,End),ev_2006_fifa_world_cup_qualification_AND_boston_legal(Start,End),AllINtervals), checkvalidity(1934,AllINtervals,Res).

check_query() :- write('Query = ev_2006_fifa_world_cup_qualification_AND_boston_legal_at_1934'), (ev_2006_fifa_world_cup_qualification_AND_boston_legal_at_1934(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2006_fifa_world_cup_qualification_AND_boston_legal_aux().

