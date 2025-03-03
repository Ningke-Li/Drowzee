:- include('database.pl').
ev_2005_formula_one_world_championship(Start,End) :- begin('ev_2005_formula_one_world_championship',_,_,Start), end('ev_2005_formula_one_world_championship',_,_,End), Start=<End.

finally_ev_2005_formula_one_world_championship_during_9_18(Start,End) :- ev_2005_formula_one_world_championship(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_ev_2005_formula_one_world_championship_during_9_18_at_1992(Res) :- setof((Start,End),finally_ev_2005_formula_one_world_championship_during_9_18(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2005_formula_one_world_championship_during_9_18_at_1992'), (finally_ev_2005_formula_one_world_championship_during_9_18_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).

