:- include('database.pl').
ev_2009_formula_one_world_championship(Start,End) :- begin('ev_2009_formula_one_world_championship',_,_,Start), end('ev_2009_formula_one_world_championship',_,_,End), Start=<End.

ev_1948_winter_olympics(Start,End) :- begin('ev_1948_winter_olympics',_,_,Start), end('ev_1948_winter_olympics',_,_,End), Start=<End.

generate_facts_ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics([]) :- assert(ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics(-1,-1)).

generate_facts_ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics([(Start,End) | Tail]) :- assert(ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics(Start,End)), generate_facts_ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics(Tail).

ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics_aux() :- findall((Start,End),ev_2009_formula_one_world_championship(Start,End),Interval1), findall((Start,End),ev_1948_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics(Interval).

ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics_at_1948(Res) :- setof((Start,End),ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics_at_1948'), (ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2009_formula_one_world_championship_OR_ev_1948_winter_olympics_aux().

