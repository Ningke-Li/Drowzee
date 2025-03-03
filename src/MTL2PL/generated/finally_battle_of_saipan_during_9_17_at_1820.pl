:- include('database.pl').
battle_of_saipan(Start,End) :- begin('battle_of_saipan',_,_,Start), end('battle_of_saipan',_,_,End), Start=<End.

finally_battle_of_saipan_during_9_17(Start,End) :- battle_of_saipan(Start1,End1), (Start1-17)=<(End1-9), Start is (Start1-17), End is (End1-9), Start=<End.

finally_battle_of_saipan_during_9_17_at_1820(Res) :- setof((Start,End),finally_battle_of_saipan_during_9_17(Start,End),AllINtervals), checkvalidity(1820,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_saipan_during_9_17_at_1820'), (finally_battle_of_saipan_during_9_17_at_1820(true) -> write('\nRes   = true');write('\nRes   = false')).

