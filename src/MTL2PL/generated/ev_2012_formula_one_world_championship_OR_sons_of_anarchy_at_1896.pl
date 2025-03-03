:- include('database.pl').
ev_2012_formula_one_world_championship(Start,End) :- begin('ev_2012_formula_one_world_championship',_,_,Start), end('ev_2012_formula_one_world_championship',_,_,End), Start=<End.

sons_of_anarchy(Start,End) :- begin('sons_of_anarchy',_,_,Start), end('sons_of_anarchy',_,_,End), Start=<End.

generate_facts_ev_2012_formula_one_world_championship_OR_sons_of_anarchy([]) :- assert(ev_2012_formula_one_world_championship_OR_sons_of_anarchy(-1,-1)).

generate_facts_ev_2012_formula_one_world_championship_OR_sons_of_anarchy([(Start,End) | Tail]) :- assert(ev_2012_formula_one_world_championship_OR_sons_of_anarchy(Start,End)), generate_facts_ev_2012_formula_one_world_championship_OR_sons_of_anarchy(Tail).

ev_2012_formula_one_world_championship_OR_sons_of_anarchy_aux() :- findall((Start,End),ev_2012_formula_one_world_championship(Start,End),Interval1), findall((Start,End),sons_of_anarchy(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_formula_one_world_championship_OR_sons_of_anarchy(Interval).

ev_2012_formula_one_world_championship_OR_sons_of_anarchy_at_1896(Res) :- setof((Start,End),ev_2012_formula_one_world_championship_OR_sons_of_anarchy(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = ev_2012_formula_one_world_championship_OR_sons_of_anarchy_at_1896'), (ev_2012_formula_one_world_championship_OR_sons_of_anarchy_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_formula_one_world_championship_OR_sons_of_anarchy_aux().

