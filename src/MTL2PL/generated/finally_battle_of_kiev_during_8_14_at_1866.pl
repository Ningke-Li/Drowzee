:- include('database.pl').
battle_of_kiev(Start,End) :- begin('battle_of_kiev',_,_,Start), end('battle_of_kiev',_,_,End), Start=<End.

finally_battle_of_kiev_during_8_14(Start,End) :- battle_of_kiev(Start1,End1), (Start1-14)=<(End1-8), Start is (Start1-14), End is (End1-8), Start=<End.

finally_battle_of_kiev_during_8_14_at_1866(Res) :- setof((Start,End),finally_battle_of_kiev_during_8_14(Start,End),AllINtervals), checkvalidity(1866,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_kiev_during_8_14_at_1866'), (finally_battle_of_kiev_during_8_14_at_1866(true) -> write('\nRes   = true');write('\nRes   = false')).

