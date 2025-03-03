:- include('database.pl').
battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

next_battle_of_h_rtgen_forest(Start,End) :- battle_of_h_rtgen_forest(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_h_rtgen_forest_at_1806(Res) :- setof((Start,End),next_battle_of_h_rtgen_forest(Start,End),AllINtervals), checkvalidity(1806,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_h_rtgen_forest_at_1806'), (next_battle_of_h_rtgen_forest_at_1806(true) -> write('\nRes   = true');write('\nRes   = false')).

