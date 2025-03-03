:- include('database.pl').
battle_of_leyte_gulf(Start,End) :- begin('battle_of_leyte_gulf',_,_,Start), end('battle_of_leyte_gulf',_,_,End), Start=<End.

finally_battle_of_leyte_gulf_during_2_14(Start,End) :- battle_of_leyte_gulf(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_battle_of_leyte_gulf_during_2_14_at_1833(Res) :- setof((Start,End),finally_battle_of_leyte_gulf_during_2_14(Start,End),AllINtervals), checkvalidity(1833,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_leyte_gulf_during_2_14_at_1833'), (finally_battle_of_leyte_gulf_during_2_14_at_1833(true) -> write('\nRes   = true');write('\nRes   = false')).

