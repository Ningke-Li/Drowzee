:- include('database.pl').
battle_of_kosovo(Start,End) :- begin('battle_of_kosovo',_,_,Start), end('battle_of_kosovo',_,_,End), Start=<End.

finally_battle_of_kosovo_during_10_16(Start,End) :- battle_of_kosovo(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_battle_of_kosovo_during_10_16_at_1438(Res) :- setof((Start,End),finally_battle_of_kosovo_during_10_16(Start,End),AllINtervals), checkvalidity(1438,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_kosovo_during_10_16_at_1438'), (finally_battle_of_kosovo_during_10_16_at_1438(true) -> write('\nRes   = true');write('\nRes   = false')).

