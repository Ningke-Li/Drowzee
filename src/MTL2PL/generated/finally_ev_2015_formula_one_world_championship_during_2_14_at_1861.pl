:- include('database.pl').
ev_2015_formula_one_world_championship(Start,End) :- begin('ev_2015_formula_one_world_championship',_,_,Start), end('ev_2015_formula_one_world_championship',_,_,End), Start=<End.

finally_ev_2015_formula_one_world_championship_during_2_14(Start,End) :- ev_2015_formula_one_world_championship(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_ev_2015_formula_one_world_championship_during_2_14_at_1861(Res) :- setof((Start,End),finally_ev_2015_formula_one_world_championship_during_2_14(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_formula_one_world_championship_during_2_14_at_1861'), (finally_ev_2015_formula_one_world_championship_during_2_14_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).

