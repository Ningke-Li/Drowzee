:- include('database.pl').
ev_2008_uefa_intertoto_cup(Start,End) :- begin('ev_2008_uefa_intertoto_cup',_,_,Start), end('ev_2008_uefa_intertoto_cup',_,_,End), Start=<End.

ev_2006_fifa_world_cup_qualification(Start,End) :- begin('ev_2006_fifa_world_cup_qualification',_,_,Start), end('ev_2006_fifa_world_cup_qualification',_,_,End), Start=<End.

generate_facts_ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification([]) :- assert(ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification(-1,-1)).

generate_facts_ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification(Start,End)), generate_facts_ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification(Tail).

ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification_aux() :- findall((Start,End),ev_2008_uefa_intertoto_cup(Start,End),Interval1), findall((Start,End),ev_2006_fifa_world_cup_qualification(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification(Interval).

ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification_at_1991(Res) :- setof((Start,End),ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification_at_1991'), (ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_uefa_intertoto_cup_OR_ev_2006_fifa_world_cup_qualification_aux().

