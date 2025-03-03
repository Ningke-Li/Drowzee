:- include('database.pl').
battle_of_madagascar(Start,End) :- begin('battle_of_madagascar',_,_,Start), end('battle_of_madagascar',_,_,End), Start=<End.

finally_battle_of_madagascar_during_4_20(Start,End) :- battle_of_madagascar(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_battle_of_madagascar_during_4_20_at_1986(Res) :- setof((Start,End),finally_battle_of_madagascar_during_4_20(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = finally_battle_of_madagascar_during_4_20_at_1986'), (finally_battle_of_madagascar_during_4_20_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).

