:- include('database.pl').
ev_2012_fifa_club_world_cup(Start,End) :- begin('ev_2012_fifa_club_world_cup',_,_,Start), end('ev_2012_fifa_club_world_cup',_,_,End), Start=<End.

battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

generate_facts_ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest([]) :- assert(ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest(-1,-1)).

generate_facts_ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest([(Start,End) | Tail]) :- assert(ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest(Start,End)), generate_facts_ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest(Tail).

ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest_aux() :- findall((Start,End),ev_2012_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),battle_of_h_rtgen_forest(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest(Interval).

ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest_at_1945(Res) :- setof((Start,End),ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest(Start,End),AllINtervals), checkvalidity(1945,AllINtervals,Res).

check_query() :- write('Query = ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest_at_1945'), (ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest_at_1945(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_fifa_club_world_cup_OR_battle_of_h_rtgen_forest_aux().

