:- include('database.pl').
ev_1950_formula_one_season(Start,End) :- begin('ev_1950_formula_one_season',_,_,Start), end('ev_1950_formula_one_season',_,_,End), Start=<End.

ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

generate_facts_ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league([]) :- assert(ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league(-1,-1)).

generate_facts_ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league([(Start,End) | Tail]) :- assert(ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league(Start,End)), generate_facts_ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league(Tail).

ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league_aux() :- findall((Start,End),ev_1950_formula_one_season(Start,End),Interval1), findall((Start,End),ev_2012_13_uefa_europa_league(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league(Interval).

ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league_at_2008(Res) :- setof((Start,End),ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league_at_2008'), (ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_1950_formula_one_season_OR_ev_2012_13_uefa_europa_league_aux().

