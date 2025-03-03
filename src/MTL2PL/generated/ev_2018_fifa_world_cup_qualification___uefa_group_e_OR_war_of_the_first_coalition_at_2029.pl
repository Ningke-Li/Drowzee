:- include('database.pl').
ev_2018_fifa_world_cup_qualification___uefa_group_e(Start,End) :- begin('ev_2018_fifa_world_cup_qualification___uefa_group_e',_,_,Start), end('ev_2018_fifa_world_cup_qualification___uefa_group_e',_,_,End), Start=<End.

war_of_the_first_coalition(Start,End) :- begin('war_of_the_first_coalition',_,_,Start), end('war_of_the_first_coalition',_,_,End), Start=<End.

generate_facts_ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition([]) :- assert(ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition(-1,-1)).

generate_facts_ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition([(Start,End) | Tail]) :- assert(ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition(Start,End)), generate_facts_ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition(Tail).

ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition_aux() :- findall((Start,End),ev_2018_fifa_world_cup_qualification___uefa_group_e(Start,End),Interval1), findall((Start,End),war_of_the_first_coalition(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition(Interval).

ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition_at_2029(Res) :- setof((Start,End),ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition(Start,End),AllINtervals), checkvalidity(2029,AllINtervals,Res).

check_query() :- write('Query = ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition_at_2029'), (ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition_at_2029(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2018_fifa_world_cup_qualification___uefa_group_e_OR_war_of_the_first_coalition_aux().

