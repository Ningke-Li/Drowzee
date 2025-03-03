:- include('database.pl').
battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

finally_battle_of_h_rtgen_forest_during_5_11(Start,End) :- battle_of_h_rtgen_forest(Start1,End1), (Start1-11)=<(End1-5), Start is (Start1-11), End is (End1-5), Start=<End.

finally_battle_of_h_rtgen_forest_during_5_11_at_1887(Res) :- setof((Start,End),finally_battle_of_h_rtgen_forest_during_5_11(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_h_rtgen_forest_during_5_11_at_1887'), (finally_battle_of_h_rtgen_forest_during_5_11_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).

