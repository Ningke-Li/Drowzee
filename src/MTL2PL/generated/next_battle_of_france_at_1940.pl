:- include('database.pl').
battle_of_france(Start,End) :- begin('battle_of_france',_,_,Start), end('battle_of_france',_,_,End), Start=<End.

next_battle_of_france(Start,End) :- battle_of_france(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_france_at_1940(Res) :- setof((Start,End),next_battle_of_france(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_france_at_1940'), (next_battle_of_france_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).

