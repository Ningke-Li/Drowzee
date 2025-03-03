:- include('database.pl').
battle_of_dunkirk(Start,End) :- begin('battle_of_dunkirk',_,_,Start), end('battle_of_dunkirk',_,_,End), Start=<End.

next_battle_of_dunkirk(Start,End) :- battle_of_dunkirk(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_dunkirk_at_1885(Res) :- setof((Start,End),next_battle_of_dunkirk(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_dunkirk_at_1885'), (next_battle_of_dunkirk_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).

