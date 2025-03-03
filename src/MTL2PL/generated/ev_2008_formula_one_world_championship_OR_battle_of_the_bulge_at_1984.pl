:- include('database.pl').
ev_2008_formula_one_world_championship(Start,End) :- begin('ev_2008_formula_one_world_championship',_,_,Start), end('ev_2008_formula_one_world_championship',_,_,End), Start=<End.

battle_of_the_bulge(Start,End) :- begin('battle_of_the_bulge',_,_,Start), end('battle_of_the_bulge',_,_,End), Start=<End.

generate_facts_ev_2008_formula_one_world_championship_OR_battle_of_the_bulge([]) :- assert(ev_2008_formula_one_world_championship_OR_battle_of_the_bulge(-1,-1)).

generate_facts_ev_2008_formula_one_world_championship_OR_battle_of_the_bulge([(Start,End) | Tail]) :- assert(ev_2008_formula_one_world_championship_OR_battle_of_the_bulge(Start,End)), generate_facts_ev_2008_formula_one_world_championship_OR_battle_of_the_bulge(Tail).

ev_2008_formula_one_world_championship_OR_battle_of_the_bulge_aux() :- findall((Start,End),ev_2008_formula_one_world_championship(Start,End),Interval1), findall((Start,End),battle_of_the_bulge(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2008_formula_one_world_championship_OR_battle_of_the_bulge(Interval).

ev_2008_formula_one_world_championship_OR_battle_of_the_bulge_at_1984(Res) :- setof((Start,End),ev_2008_formula_one_world_championship_OR_battle_of_the_bulge(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = ev_2008_formula_one_world_championship_OR_battle_of_the_bulge_at_1984'), (ev_2008_formula_one_world_championship_OR_battle_of_the_bulge_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_formula_one_world_championship_OR_battle_of_the_bulge_aux().

