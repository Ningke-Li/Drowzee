:- include('database.pl').
battle_of_verdun(Start,End) :- begin('battle_of_verdun',_,_,Start), end('battle_of_verdun',_,_,End), Start=<End.

next_battle_of_verdun(Start,End) :- battle_of_verdun(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_verdun_at_1895(Res) :- setof((Start,End),next_battle_of_verdun(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_verdun_at_1895'), (next_battle_of_verdun_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).

