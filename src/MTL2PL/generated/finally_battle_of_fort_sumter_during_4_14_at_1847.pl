:- include('database.pl').
battle_of_fort_sumter(Start,End) :- begin('battle_of_fort_sumter',_,_,Start), end('battle_of_fort_sumter',_,_,End), Start=<End.

finally_battle_of_fort_sumter_during_4_14(Start,End) :- battle_of_fort_sumter(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_battle_of_fort_sumter_during_4_14_at_1847(Res) :- setof((Start,End),finally_battle_of_fort_sumter_during_4_14(Start,End),AllINtervals), checkvalidity(1847,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_fort_sumter_during_4_14_at_1847'), (finally_battle_of_fort_sumter_during_4_14_at_1847(true) -> write('\nRes   = true');write('\nRes   = false')).

