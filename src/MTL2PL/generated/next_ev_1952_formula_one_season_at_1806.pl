:- include('database.pl').
ev_1952_formula_one_season(Start,End) :- begin('ev_1952_formula_one_season',_,_,Start), end('ev_1952_formula_one_season',_,_,End), Start=<End.

next_ev_1952_formula_one_season(Start,End) :- ev_1952_formula_one_season(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1952_formula_one_season_at_1806(Res) :- setof((Start,End),next_ev_1952_formula_one_season(Start,End),AllINtervals), checkvalidity(1806,AllINtervals,Res).

check_query() :- write('Query = next_ev_1952_formula_one_season_at_1806'), (next_ev_1952_formula_one_season_at_1806(true) -> write('\nRes   = true');write('\nRes   = false')).

