:- include('database.pl').
ev_2013_formula_one_world_championship__fia_(Start,End) :- begin('ev_2013_formula_one_world_championship__fia_',_,_,Start), end('ev_2013_formula_one_world_championship__fia_',_,_,End), Start=<End.

heroes(Start,End) :- begin('heroes',_,_,Start), end('heroes',_,_,End), Start=<End.

generate_facts_ev_2013_formula_one_world_championship__fia__OR_heroes([]) :- assert(ev_2013_formula_one_world_championship__fia__OR_heroes(-1,-1)).

generate_facts_ev_2013_formula_one_world_championship__fia__OR_heroes([(Start,End) | Tail]) :- assert(ev_2013_formula_one_world_championship__fia__OR_heroes(Start,End)), generate_facts_ev_2013_formula_one_world_championship__fia__OR_heroes(Tail).

ev_2013_formula_one_world_championship__fia__OR_heroes_aux() :- findall((Start,End),ev_2013_formula_one_world_championship__fia_(Start,End),Interval1), findall((Start,End),heroes(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_formula_one_world_championship__fia__OR_heroes(Interval).

ev_2013_formula_one_world_championship__fia__OR_heroes_at_2010(Res) :- setof((Start,End),ev_2013_formula_one_world_championship__fia__OR_heroes(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = ev_2013_formula_one_world_championship__fia__OR_heroes_at_2010'), (ev_2013_formula_one_world_championship__fia__OR_heroes_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_formula_one_world_championship__fia__OR_heroes_aux().

