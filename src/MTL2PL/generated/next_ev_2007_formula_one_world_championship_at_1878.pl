:- include('database.pl').
ev_2007_formula_one_world_championship(Start,End) :- begin('ev_2007_formula_one_world_championship',_,_,Start), end('ev_2007_formula_one_world_championship',_,_,End), Start=<End.

next_ev_2007_formula_one_world_championship(Start,End) :- ev_2007_formula_one_world_championship(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2007_formula_one_world_championship_at_1878(Res) :- setof((Start,End),next_ev_2007_formula_one_world_championship(Start,End),AllINtervals), checkvalidity(1878,AllINtervals,Res).

check_query() :- write('Query = next_ev_2007_formula_one_world_championship_at_1878'), (next_ev_2007_formula_one_world_championship_at_1878(true) -> write('\nRes   = true');write('\nRes   = false')).

