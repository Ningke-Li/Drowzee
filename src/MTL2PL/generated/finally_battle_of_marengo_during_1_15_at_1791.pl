:- include('database.pl').
battle_of_marengo(Start,End) :- begin('battle_of_marengo',_,_,Start), end('battle_of_marengo',_,_,End), Start=<End.

finally_battle_of_marengo_during_1_15(Start,End) :- battle_of_marengo(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

finally_battle_of_marengo_during_1_15_at_1791(Res) :- setof((Start,End),finally_battle_of_marengo_during_1_15(Start,End),AllINtervals), checkvalidity(1791,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_marengo_during_1_15_at_1791'), (finally_battle_of_marengo_during_1_15_at_1791(true) -> write('\nRes   = true');write('\nRes   = false')).

