:- include('database.pl').
ev_2010_formula_one_world_championship(Start,End) :- begin('ev_2010_formula_one_world_championship',_,_,Start), end('ev_2010_formula_one_world_championship',_,_,End), Start=<End.

allied_invasion_of_italy(Start,End) :- begin('allied_invasion_of_italy',_,_,Start), end('allied_invasion_of_italy',_,_,End), Start=<End.

generate_facts_ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy([]) :- assert(ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy(-1,-1)).

generate_facts_ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy([(Start,End) | Tail]) :- assert(ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy(Start,End)), generate_facts_ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy(Tail).

ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy_aux() :- findall((Start,End),ev_2010_formula_one_world_championship(Start,End),Interval1), findall((Start,End),allied_invasion_of_italy(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy(Interval).

ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy_at_1841(Res) :- setof((Start,End),ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy(Start,End),AllINtervals), checkvalidity(1841,AllINtervals,Res).

check_query() :- write('Query = ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy_at_1841'), (ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy_at_1841(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_formula_one_world_championship_OR_allied_invasion_of_italy_aux().

