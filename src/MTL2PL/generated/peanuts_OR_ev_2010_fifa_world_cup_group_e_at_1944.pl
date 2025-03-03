:- include('database.pl').
peanuts(Start,End) :- begin('peanuts',_,_,Start), end('peanuts',_,_,End), Start=<End.

ev_2010_fifa_world_cup_group_e(Start,End) :- begin('ev_2010_fifa_world_cup_group_e',_,_,Start), end('ev_2010_fifa_world_cup_group_e',_,_,End), Start=<End.

generate_facts_peanuts_OR_ev_2010_fifa_world_cup_group_e([]) :- assert(peanuts_OR_ev_2010_fifa_world_cup_group_e(-1,-1)).

generate_facts_peanuts_OR_ev_2010_fifa_world_cup_group_e([(Start,End) | Tail]) :- assert(peanuts_OR_ev_2010_fifa_world_cup_group_e(Start,End)), generate_facts_peanuts_OR_ev_2010_fifa_world_cup_group_e(Tail).

peanuts_OR_ev_2010_fifa_world_cup_group_e_aux() :- findall((Start,End),peanuts(Start,End),Interval1), findall((Start,End),ev_2010_fifa_world_cup_group_e(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_peanuts_OR_ev_2010_fifa_world_cup_group_e(Interval).

peanuts_OR_ev_2010_fifa_world_cup_group_e_at_1944(Res) :- setof((Start,End),peanuts_OR_ev_2010_fifa_world_cup_group_e(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = peanuts_OR_ev_2010_fifa_world_cup_group_e_at_1944'), (peanuts_OR_ev_2010_fifa_world_cup_group_e_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- peanuts_OR_ev_2010_fifa_world_cup_group_e_aux().

