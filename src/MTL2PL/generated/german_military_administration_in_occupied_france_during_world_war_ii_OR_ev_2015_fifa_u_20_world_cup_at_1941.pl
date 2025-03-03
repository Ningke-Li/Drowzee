:- include('database.pl').
german_military_administration_in_occupied_france_during_world_war_ii(Start,End) :- begin('german_military_administration_in_occupied_france_during_world_war_ii',_,_,Start), end('german_military_administration_in_occupied_france_during_world_war_ii',_,_,End), Start=<End.

ev_2015_fifa_u_20_world_cup(Start,End) :- begin('ev_2015_fifa_u_20_world_cup',_,_,Start), end('ev_2015_fifa_u_20_world_cup',_,_,End), Start=<End.

generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup([]) :- assert(german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup(-1,-1)).

generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup([(Start,End) | Tail]) :- assert(german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup(Start,End)), generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup(Tail).

german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup_aux() :- findall((Start,End),german_military_administration_in_occupied_france_during_world_war_ii(Start,End),Interval1), findall((Start,End),ev_2015_fifa_u_20_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup(Interval).

german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup_at_1941(Res) :- setof((Start,End),german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup_at_1941'), (german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).
?- german_military_administration_in_occupied_france_during_world_war_ii_OR_ev_2015_fifa_u_20_world_cup_aux().

