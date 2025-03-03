:- include('database.pl').
ev_2015_formula_one_world_championship(Start,End) :- begin('ev_2015_formula_one_world_championship',_,_,Start), end('ev_2015_formula_one_world_championship',_,_,End), Start=<End.

ev_2016_17_uefa_europa_league(Start,End) :- begin('ev_2016_17_uefa_europa_league',_,_,Start), end('ev_2016_17_uefa_europa_league',_,_,End), Start=<End.

generate_facts_ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league([]) :- assert(ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league(-1,-1)).

generate_facts_ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league([(Start,End) | Tail]) :- assert(ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league(Start,End)), generate_facts_ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league(Tail).

ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league_aux() :- findall((Start,End),ev_2015_formula_one_world_championship(Start,End),Interval1), findall((Start,End),ev_2016_17_uefa_europa_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league(Interval).

ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league_at_2061(Res) :- setof((Start,End),ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league(Start,End),AllINtervals), checkvalidity(2061,AllINtervals,Res).

check_query() :- write('Query = ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league_at_2061'), (ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league_at_2061(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_formula_one_world_championship_OR_ev_2016_17_uefa_europa_league_aux().

