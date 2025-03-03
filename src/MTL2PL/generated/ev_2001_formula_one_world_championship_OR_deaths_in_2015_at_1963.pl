:- include('database.pl').
ev_2001_formula_one_world_championship(Start,End) :- begin('ev_2001_formula_one_world_championship',_,_,Start), end('ev_2001_formula_one_world_championship',_,_,End), Start=<End.

deaths_in_2015(Start,End) :- begin('deaths_in_2015',_,_,Start), end('deaths_in_2015',_,_,End), Start=<End.

generate_facts_ev_2001_formula_one_world_championship_OR_deaths_in_2015([]) :- assert(ev_2001_formula_one_world_championship_OR_deaths_in_2015(-1,-1)).

generate_facts_ev_2001_formula_one_world_championship_OR_deaths_in_2015([(Start,End) | Tail]) :- assert(ev_2001_formula_one_world_championship_OR_deaths_in_2015(Start,End)), generate_facts_ev_2001_formula_one_world_championship_OR_deaths_in_2015(Tail).

ev_2001_formula_one_world_championship_OR_deaths_in_2015_aux() :- findall((Start,End),ev_2001_formula_one_world_championship(Start,End),Interval1), findall((Start,End),deaths_in_2015(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2001_formula_one_world_championship_OR_deaths_in_2015(Interval).

ev_2001_formula_one_world_championship_OR_deaths_in_2015_at_1963(Res) :- setof((Start,End),ev_2001_formula_one_world_championship_OR_deaths_in_2015(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = ev_2001_formula_one_world_championship_OR_deaths_in_2015_at_1963'), (ev_2001_formula_one_world_championship_OR_deaths_in_2015_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2001_formula_one_world_championship_OR_deaths_in_2015_aux().

