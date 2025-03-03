:- include('database.pl').
battle_of_eylau(Start,End) :- begin('battle_of_eylau',_,_,Start), end('battle_of_eylau',_,_,End), Start=<End.

ev_2015_rugby_world_cup(Start,End) :- begin('ev_2015_rugby_world_cup',_,_,Start), end('ev_2015_rugby_world_cup',_,_,End), Start=<End.

generate_facts_battle_of_eylau_OR_ev_2015_rugby_world_cup([]) :- assert(battle_of_eylau_OR_ev_2015_rugby_world_cup(-1,-1)).

generate_facts_battle_of_eylau_OR_ev_2015_rugby_world_cup([(Start,End) | Tail]) :- assert(battle_of_eylau_OR_ev_2015_rugby_world_cup(Start,End)), generate_facts_battle_of_eylau_OR_ev_2015_rugby_world_cup(Tail).

battle_of_eylau_OR_ev_2015_rugby_world_cup_aux() :- findall((Start,End),battle_of_eylau(Start,End),Interval1), findall((Start,End),ev_2015_rugby_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_eylau_OR_ev_2015_rugby_world_cup(Interval).

battle_of_eylau_OR_ev_2015_rugby_world_cup_at_2005(Res) :- setof((Start,End),battle_of_eylau_OR_ev_2015_rugby_world_cup(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = battle_of_eylau_OR_ev_2015_rugby_world_cup_at_2005'), (battle_of_eylau_OR_ev_2015_rugby_world_cup_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_eylau_OR_ev_2015_rugby_world_cup_aux().

