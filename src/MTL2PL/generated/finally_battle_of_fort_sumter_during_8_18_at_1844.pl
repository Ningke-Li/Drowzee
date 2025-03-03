:- include('database.pl').
battle_of_fort_sumter(Start,End) :- begin('battle_of_fort_sumter',_,_,Start), end('battle_of_fort_sumter',_,_,End), Start=<End.

finally_battle_of_fort_sumter_during_8_18(Start,End) :- battle_of_fort_sumter(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_battle_of_fort_sumter_during_8_18_at_1844(Res) :- setof((Start,End),finally_battle_of_fort_sumter_during_8_18(Start,End),AllINtervals), checkvalidity(1844,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_fort_sumter_during_8_18_at_1844'), (finally_battle_of_fort_sumter_during_8_18_at_1844(true) -> write('\nRes   = true');write('\nRes   = false')).

