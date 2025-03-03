:- include('database.pl').
battle_of_galicia(Start,End) :- begin('battle_of_galicia',_,_,Start), end('battle_of_galicia',_,_,End), Start=<End.

next_battle_of_galicia(Start,End) :- battle_of_galicia(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_galicia_at_1913(Res) :- setof((Start,End),next_battle_of_galicia(Start,End),AllINtervals), checkvalidity(1913,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_galicia_at_1913'), (next_battle_of_galicia_at_1913(true) -> write('\nRes   = true');write('\nRes   = false')).

