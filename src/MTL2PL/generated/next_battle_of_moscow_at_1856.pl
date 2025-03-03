:- include('database.pl').
battle_of_moscow(Start,End) :- begin('battle_of_moscow',_,_,Start), end('battle_of_moscow',_,_,End), Start=<End.

next_battle_of_moscow(Start,End) :- battle_of_moscow(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_moscow_at_1856(Res) :- setof((Start,End),next_battle_of_moscow(Start,End),AllINtervals), checkvalidity(1856,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_moscow_at_1856'), (next_battle_of_moscow_at_1856(true) -> write('\nRes   = true');write('\nRes   = false')).

