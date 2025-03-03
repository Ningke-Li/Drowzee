:- include('database.pl').
total_drama_island(Start,End) :- begin('total_drama_island',_,_,Start), end('total_drama_island',_,_,End), Start=<End.

ev_1952_formula_one_season(Start,End) :- begin('ev_1952_formula_one_season',_,_,Start), end('ev_1952_formula_one_season',_,_,End), Start=<End.

generate_facts_total_drama_island_OR_ev_1952_formula_one_season([]) :- assert(total_drama_island_OR_ev_1952_formula_one_season(-1,-1)).

generate_facts_total_drama_island_OR_ev_1952_formula_one_season([(Start,End) | Tail]) :- assert(total_drama_island_OR_ev_1952_formula_one_season(Start,End)), generate_facts_total_drama_island_OR_ev_1952_formula_one_season(Tail).

total_drama_island_OR_ev_1952_formula_one_season_aux() :- findall((Start,End),total_drama_island(Start,End),Interval1), findall((Start,End),ev_1952_formula_one_season(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_total_drama_island_OR_ev_1952_formula_one_season(Interval).

total_drama_island_OR_ev_1952_formula_one_season_at_2009(Res) :- setof((Start,End),total_drama_island_OR_ev_1952_formula_one_season(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = total_drama_island_OR_ev_1952_formula_one_season_at_2009'), (total_drama_island_OR_ev_1952_formula_one_season_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- total_drama_island_OR_ev_1952_formula_one_season_aux().

