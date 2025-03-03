:- include('database.pl').
ev_2010_fifa_world_cup_group_f(Start,End) :- begin('ev_2010_fifa_world_cup_group_f',_,_,Start), end('ev_2010_fifa_world_cup_group_f',_,_,End), Start=<End.

battle_of_marengo(Start,End) :- begin('battle_of_marengo',_,_,Start), end('battle_of_marengo',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo([]) :- assert(ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo(-1,-1)).

generate_facts_ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo([(Start,End) | Tail]) :- assert(ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo(Start,End)), generate_facts_ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo(Tail).

ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo_aux() :- findall((Start,End),ev_2010_fifa_world_cup_group_f(Start,End),Interval1), findall((Start,End),battle_of_marengo(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo(Interval).

ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo_at_1960(Res) :- setof((Start,End),ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo(Start,End),AllINtervals), checkvalidity(1960,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo_at_1960'), (ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo_at_1960(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_world_cup_group_f_OR_battle_of_marengo_aux().

