:- include('database.pl').
ev_2010_formula_one_world_championship(Start,End) :- begin('ev_2010_formula_one_world_championship',_,_,Start), end('ev_2010_formula_one_world_championship',_,_,End), Start=<End.

finally_ev_2010_formula_one_world_championship_during_7_16(Start,End) :- ev_2010_formula_one_world_championship(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

finally_ev_2010_formula_one_world_championship_during_7_16_at_1942(Res) :- setof((Start,End),finally_ev_2010_formula_one_world_championship_during_7_16(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_formula_one_world_championship_during_7_16_at_1942'), (finally_ev_2010_formula_one_world_championship_during_7_16_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).

