:- include('database.pl').
ev_2006_formula_one_world_championship(Start,End) :- begin('ev_2006_formula_one_world_championship',_,_,Start), end('ev_2006_formula_one_world_championship',_,_,End), Start=<End.

finally_ev_2006_formula_one_world_championship_during_3_14(Start,End) :- ev_2006_formula_one_world_championship(Start1,End1), (Start1-14)=<(End1-3), Start is (Start1-14), End is (End1-3), Start=<End.

finally_ev_2006_formula_one_world_championship_during_3_14_at_1865(Res) :- setof((Start,End),finally_ev_2006_formula_one_world_championship_during_3_14(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2006_formula_one_world_championship_during_3_14_at_1865'), (finally_ev_2006_formula_one_world_championship_during_3_14_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

