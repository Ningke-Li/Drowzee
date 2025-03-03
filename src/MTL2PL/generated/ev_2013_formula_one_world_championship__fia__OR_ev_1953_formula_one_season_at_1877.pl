:- include('database.pl').
ev_2013_formula_one_world_championship__fia_(Start,End) :- begin('ev_2013_formula_one_world_championship__fia_',_,_,Start), end('ev_2013_formula_one_world_championship__fia_',_,_,End), Start=<End.

ev_1953_formula_one_season(Start,End) :- begin('ev_1953_formula_one_season',_,_,Start), end('ev_1953_formula_one_season',_,_,End), Start=<End.

generate_facts_ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season([]) :- assert(ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season(-1,-1)).

generate_facts_ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season([(Start,End) | Tail]) :- assert(ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season(Start,End)), generate_facts_ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season(Tail).

ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season_aux() :- findall((Start,End),ev_2013_formula_one_world_championship__fia_(Start,End),Interval1), findall((Start,End),ev_1953_formula_one_season(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season(Interval).

ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season_at_1877(Res) :- setof((Start,End),ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season_at_1877'), (ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_formula_one_world_championship__fia__OR_ev_1953_formula_one_season_aux().

