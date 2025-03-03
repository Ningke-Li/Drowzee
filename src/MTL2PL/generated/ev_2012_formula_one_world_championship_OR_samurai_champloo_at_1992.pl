:- include('database.pl').
ev_2012_formula_one_world_championship(Start,End) :- begin('ev_2012_formula_one_world_championship',_,_,Start), end('ev_2012_formula_one_world_championship',_,_,End), Start=<End.

samurai_champloo(Start,End) :- begin('samurai_champloo',_,_,Start), end('samurai_champloo',_,_,End), Start=<End.

generate_facts_ev_2012_formula_one_world_championship_OR_samurai_champloo([]) :- assert(ev_2012_formula_one_world_championship_OR_samurai_champloo(-1,-1)).

generate_facts_ev_2012_formula_one_world_championship_OR_samurai_champloo([(Start,End) | Tail]) :- assert(ev_2012_formula_one_world_championship_OR_samurai_champloo(Start,End)), generate_facts_ev_2012_formula_one_world_championship_OR_samurai_champloo(Tail).

ev_2012_formula_one_world_championship_OR_samurai_champloo_aux() :- findall((Start,End),ev_2012_formula_one_world_championship(Start,End),Interval1), findall((Start,End),samurai_champloo(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_formula_one_world_championship_OR_samurai_champloo(Interval).

ev_2012_formula_one_world_championship_OR_samurai_champloo_at_1992(Res) :- setof((Start,End),ev_2012_formula_one_world_championship_OR_samurai_champloo(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = ev_2012_formula_one_world_championship_OR_samurai_champloo_at_1992'), (ev_2012_formula_one_world_championship_OR_samurai_champloo_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_formula_one_world_championship_OR_samurai_champloo_aux().

