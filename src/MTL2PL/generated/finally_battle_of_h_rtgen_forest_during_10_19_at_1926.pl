:- include('database.pl').
battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

finally_battle_of_h_rtgen_forest_during_10_19(Start,End) :- battle_of_h_rtgen_forest(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

finally_battle_of_h_rtgen_forest_during_10_19_at_1926(Res) :- setof((Start,End),finally_battle_of_h_rtgen_forest_during_10_19(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_h_rtgen_forest_during_10_19_at_1926'), (finally_battle_of_h_rtgen_forest_during_10_19_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).

