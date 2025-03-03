:- include('database.pl').
battle_of_smolensk(Start,End) :- begin('battle_of_smolensk',_,_,Start), end('battle_of_smolensk',_,_,End), Start=<End.

finally_battle_of_smolensk_during_4_17(Start,End) :- battle_of_smolensk(Start1,End1), (Start1-17)=<(End1-4), Start is (Start1-17), End is (End1-4), Start=<End.

finally_battle_of_smolensk_during_4_17_at_1894(Res) :- setof((Start,End),finally_battle_of_smolensk_during_4_17(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_smolensk_during_4_17_at_1894'), (finally_battle_of_smolensk_during_4_17_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).

