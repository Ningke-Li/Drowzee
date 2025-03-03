:- include('database.pl').
world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification__afc_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__afc_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__afc_',_,_,End), Start=<End.

generate_facts_world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc_([]) :- assert(world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc_(-1,-1)).

generate_facts_world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc_([(Start,End) | Tail]) :- assert(world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc_(Start,End)), generate_facts_world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc_(Tail).

world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc__aux() :- findall((Start,End),world_war_ii_in_yugoslavia(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification__afc_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc_(Interval).

world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc__at_2025(Res) :- setof((Start,End),world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc_(Start,End),AllINtervals), checkvalidity(2025,AllINtervals,Res).

check_query() :- write('Query = world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc__at_2025'), (world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc__at_2025(true) -> write('\nRes   = true');write('\nRes   = false')).
?- world_war_ii_in_yugoslavia_OR_ev_2018_fifa_world_cup_qualification__afc__aux().

