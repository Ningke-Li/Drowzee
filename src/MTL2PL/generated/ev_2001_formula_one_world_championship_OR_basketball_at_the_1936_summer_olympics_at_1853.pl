:- include('database.pl').
ev_2001_formula_one_world_championship(Start,End) :- begin('ev_2001_formula_one_world_championship',_,_,Start), end('ev_2001_formula_one_world_championship',_,_,End), Start=<End.

basketball_at_the_1936_summer_olympics(Start,End) :- begin('basketball_at_the_1936_summer_olympics',_,_,Start), end('basketball_at_the_1936_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics([]) :- assert(ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics(-1,-1)).

generate_facts_ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics([(Start,End) | Tail]) :- assert(ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics(Start,End)), generate_facts_ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics(Tail).

ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics_aux() :- findall((Start,End),ev_2001_formula_one_world_championship(Start,End),Interval1), findall((Start,End),basketball_at_the_1936_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics(Interval).

ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics_at_1853(Res) :- setof((Start,End),ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics(Start,End),AllINtervals), checkvalidity(1853,AllINtervals,Res).

check_query() :- write('Query = ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics_at_1853'), (ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics_at_1853(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2001_formula_one_world_championship_OR_basketball_at_the_1936_summer_olympics_aux().

