:- include('database.pl').
battle_of_smolensk(Start,End) :- begin('battle_of_smolensk',_,_,Start), end('battle_of_smolensk',_,_,End), Start=<End.

finally_battle_of_smolensk_during_9_12(Start,End) :- battle_of_smolensk(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_battle_of_smolensk_during_9_12_at_1796(Res) :- setof((Start,End),finally_battle_of_smolensk_during_9_12(Start,End),AllINtervals), checkvalidity(1796,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_smolensk_during_9_12_at_1796'), (finally_battle_of_smolensk_during_9_12_at_1796(true) -> write('\nRes   = true');write('\nRes   = false')).

