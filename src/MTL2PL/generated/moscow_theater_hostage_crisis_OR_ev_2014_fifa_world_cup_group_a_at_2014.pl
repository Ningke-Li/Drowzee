:- include('database.pl').
moscow_theater_hostage_crisis(Start,End) :- begin('moscow_theater_hostage_crisis',_,_,Start), end('moscow_theater_hostage_crisis',_,_,End), Start=<End.

ev_2014_fifa_world_cup_group_a(Start,End) :- begin('ev_2014_fifa_world_cup_group_a',_,_,Start), end('ev_2014_fifa_world_cup_group_a',_,_,End), Start=<End.

generate_facts_moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a([]) :- assert(moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a(-1,-1)).

generate_facts_moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a([(Start,End) | Tail]) :- assert(moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a(Start,End)), generate_facts_moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a(Tail).

moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a_aux() :- findall((Start,End),moscow_theater_hostage_crisis(Start,End),Interval1), findall((Start,End),ev_2014_fifa_world_cup_group_a(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a(Interval).

moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a_at_2014(Res) :- setof((Start,End),moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a_at_2014'), (moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- moscow_theater_hostage_crisis_OR_ev_2014_fifa_world_cup_group_a_aux().

