:- include('database.pl').
ev_2014_formula_one_world_championship(Start,End) :- begin('ev_2014_formula_one_world_championship',_,_,Start), end('ev_2014_formula_one_world_championship',_,_,End), Start=<End.

azuchi_momoyama_period(Start,End) :- begin('azuchi_momoyama_period',_,_,Start), end('azuchi_momoyama_period',_,_,End), Start=<End.

generate_facts_ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period([]) :- assert(ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period(-1,-1)).

generate_facts_ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period([(Start,End) | Tail]) :- assert(ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period(Start,End)), generate_facts_ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period(Tail).

ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period_aux() :- findall((Start,End),ev_2014_formula_one_world_championship(Start,End),Interval1), findall((Start,End),azuchi_momoyama_period(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period(Interval).

ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period_at_1571(Res) :- setof((Start,End),ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period(Start,End),AllINtervals), checkvalidity(1571,AllINtervals,Res).

check_query() :- write('Query = ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period_at_1571'), (ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period_at_1571(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_formula_one_world_championship_OR_azuchi_momoyama_period_aux().

