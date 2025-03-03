:- include('database.pl').
battle_of_greece(Start,End) :- begin('battle_of_greece',_,_,Start), end('battle_of_greece',_,_,End), Start=<End.

finally_battle_of_greece_during_7_15(Start,End) :- battle_of_greece(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_battle_of_greece_during_7_15_at_1929(Res) :- setof((Start,End),finally_battle_of_greece_during_7_15(Start,End),AllINtervals), checkvalidity(1929,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_greece_during_7_15_at_1929'), (finally_battle_of_greece_during_7_15_at_1929(true) -> write('\nRes   = true');write('\nRes   = false')).

