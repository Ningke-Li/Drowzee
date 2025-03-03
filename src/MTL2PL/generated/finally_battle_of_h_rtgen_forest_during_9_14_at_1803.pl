:- include('database.pl').
battle_of_h_rtgen_forest(Start,End) :- begin('battle_of_h_rtgen_forest',_,_,Start), end('battle_of_h_rtgen_forest',_,_,End), Start=<End.

finally_battle_of_h_rtgen_forest_during_9_14(Start,End) :- battle_of_h_rtgen_forest(Start1,End1), (Start1-14)=<(End1-9), Start is (Start1-14), End is (End1-9), Start=<End.

finally_battle_of_h_rtgen_forest_during_9_14_at_1803(Res) :- setof((Start,End),finally_battle_of_h_rtgen_forest_during_9_14(Start,End),AllINtervals), checkvalidity(1803,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_h_rtgen_forest_during_9_14_at_1803'), (finally_battle_of_h_rtgen_forest_during_9_14_at_1803(true) -> write('\nRes   = true');write('\nRes   = false')).

