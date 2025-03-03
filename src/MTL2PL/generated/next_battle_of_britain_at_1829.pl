:- include('database.pl').
battle_of_britain(Start,End) :- begin('battle_of_britain',_,_,Start), end('battle_of_britain',_,_,End), Start=<End.

next_battle_of_britain(Start,End) :- battle_of_britain(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_britain_at_1829(Res) :- setof((Start,End),next_battle_of_britain(Start,End),AllINtervals), checkvalidity(1829,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_britain_at_1829'), (next_battle_of_britain_at_1829(true) -> write('\nRes   = true');write('\nRes   = false')).

