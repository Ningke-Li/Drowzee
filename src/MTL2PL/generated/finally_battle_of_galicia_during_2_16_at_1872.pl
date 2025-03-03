:- include('database.pl').
battle_of_galicia(Start,End) :- begin('battle_of_galicia',_,_,Start), end('battle_of_galicia',_,_,End), Start=<End.

finally_battle_of_galicia_during_2_16(Start,End) :- battle_of_galicia(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

finally_battle_of_galicia_during_2_16_at_1872(Res) :- setof((Start,End),finally_battle_of_galicia_during_2_16(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_galicia_during_2_16_at_1872'), (finally_battle_of_galicia_during_2_16_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).

