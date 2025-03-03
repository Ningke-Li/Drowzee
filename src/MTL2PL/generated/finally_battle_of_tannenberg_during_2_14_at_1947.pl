:- include('database.pl').
battle_of_tannenberg(Start,End) :- begin('battle_of_tannenberg',_,_,Start), end('battle_of_tannenberg',_,_,End), Start=<End.

finally_battle_of_tannenberg_during_2_14(Start,End) :- battle_of_tannenberg(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_battle_of_tannenberg_during_2_14_at_1947(Res) :- setof((Start,End),finally_battle_of_tannenberg_during_2_14(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_tannenberg_during_2_14_at_1947'), (finally_battle_of_tannenberg_during_2_14_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

