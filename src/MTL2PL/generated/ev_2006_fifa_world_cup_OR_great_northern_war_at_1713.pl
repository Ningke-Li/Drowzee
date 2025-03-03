:- include('database.pl').
ev_2006_fifa_world_cup(Start,End) :- begin('ev_2006_fifa_world_cup',_,_,Start), end('ev_2006_fifa_world_cup',_,_,End), Start=<End.

great_northern_war(Start,End) :- begin('great_northern_war',_,_,Start), end('great_northern_war',_,_,End), Start=<End.

generate_facts_ev_2006_fifa_world_cup_OR_great_northern_war([]) :- assert(ev_2006_fifa_world_cup_OR_great_northern_war(-1,-1)).

generate_facts_ev_2006_fifa_world_cup_OR_great_northern_war([(Start,End) | Tail]) :- assert(ev_2006_fifa_world_cup_OR_great_northern_war(Start,End)), generate_facts_ev_2006_fifa_world_cup_OR_great_northern_war(Tail).

ev_2006_fifa_world_cup_OR_great_northern_war_aux() :- findall((Start,End),ev_2006_fifa_world_cup(Start,End),Interval1), findall((Start,End),great_northern_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2006_fifa_world_cup_OR_great_northern_war(Interval).

ev_2006_fifa_world_cup_OR_great_northern_war_at_1713(Res) :- setof((Start,End),ev_2006_fifa_world_cup_OR_great_northern_war(Start,End),AllINtervals), checkvalidity(1713,AllINtervals,Res).

check_query() :- write('Query = ev_2006_fifa_world_cup_OR_great_northern_war_at_1713'), (ev_2006_fifa_world_cup_OR_great_northern_war_at_1713(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2006_fifa_world_cup_OR_great_northern_war_aux().

