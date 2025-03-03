:- include('database.pl').
battle_of_sarikamish(Start,End) :- begin('battle_of_sarikamish',_,_,Start), end('battle_of_sarikamish',_,_,End), Start=<End.

finally_battle_of_sarikamish_during_7_17(Start,End) :- battle_of_sarikamish(Start1,End1), (Start1-17)=<(End1-7), Start is (Start1-17), End is (End1-7), Start=<End.

finally_battle_of_sarikamish_during_7_17_at_1842(Res) :- setof((Start,End),finally_battle_of_sarikamish_during_7_17(Start,End),AllINtervals), checkvalidity(1842,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_sarikamish_during_7_17_at_1842'), (finally_battle_of_sarikamish_during_7_17_at_1842(true) -> write('\nRes   = true');write('\nRes   = false')).

