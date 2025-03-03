:- include('database.pl').
battle_of_aachen(Start,End) :- begin('battle_of_aachen',_,_,Start), end('battle_of_aachen',_,_,End), Start=<End.

next_battle_of_aachen(Start,End) :- battle_of_aachen(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_aachen_at_1826(Res) :- setof((Start,End),next_battle_of_aachen(Start,End),AllINtervals), checkvalidity(1826,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_aachen_at_1826'), (next_battle_of_aachen_at_1826(true) -> write('\nRes   = true');write('\nRes   = false')).

