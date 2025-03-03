:- include('database.pl').
ev_1952_formula_one_season(Start,End) :- begin('ev_1952_formula_one_season',_,_,Start), end('ev_1952_formula_one_season',_,_,End), Start=<End.

finally_ev_1952_formula_one_season_during_8_16(Start,End) :- ev_1952_formula_one_season(Start1,End1), (Start1-16)=<(End1-8), Start is (Start1-16), End is (End1-8), Start=<End.

finally_ev_1952_formula_one_season_during_8_16_at_1902(Res) :- setof((Start,End),finally_ev_1952_formula_one_season_during_8_16(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1952_formula_one_season_during_8_16_at_1902'), (finally_ev_1952_formula_one_season_during_8_16_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

