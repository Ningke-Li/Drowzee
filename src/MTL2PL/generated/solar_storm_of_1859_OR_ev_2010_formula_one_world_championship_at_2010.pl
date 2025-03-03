:- include('database.pl').
solar_storm_of_1859(Start,End) :- begin('solar_storm_of_1859',_,_,Start), end('solar_storm_of_1859',_,_,End), Start=<End.

ev_2010_formula_one_world_championship(Start,End) :- begin('ev_2010_formula_one_world_championship',_,_,Start), end('ev_2010_formula_one_world_championship',_,_,End), Start=<End.

generate_facts_solar_storm_of_1859_OR_ev_2010_formula_one_world_championship([]) :- assert(solar_storm_of_1859_OR_ev_2010_formula_one_world_championship(-1,-1)).

generate_facts_solar_storm_of_1859_OR_ev_2010_formula_one_world_championship([(Start,End) | Tail]) :- assert(solar_storm_of_1859_OR_ev_2010_formula_one_world_championship(Start,End)), generate_facts_solar_storm_of_1859_OR_ev_2010_formula_one_world_championship(Tail).

solar_storm_of_1859_OR_ev_2010_formula_one_world_championship_aux() :- findall((Start,End),solar_storm_of_1859(Start,End),Interval1), findall((Start,End),ev_2010_formula_one_world_championship(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_solar_storm_of_1859_OR_ev_2010_formula_one_world_championship(Interval).

solar_storm_of_1859_OR_ev_2010_formula_one_world_championship_at_2010(Res) :- setof((Start,End),solar_storm_of_1859_OR_ev_2010_formula_one_world_championship(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = solar_storm_of_1859_OR_ev_2010_formula_one_world_championship_at_2010'), (solar_storm_of_1859_OR_ev_2010_formula_one_world_championship_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- solar_storm_of_1859_OR_ev_2010_formula_one_world_championship_aux().

