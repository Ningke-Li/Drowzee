:- include('database.pl').
battle_of_tsushima(Start,End) :- begin('battle_of_tsushima',_,_,Start), end('battle_of_tsushima',_,_,End), Start=<End.

next_battle_of_tsushima(Start,End) :- battle_of_tsushima(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_tsushima_at_1901(Res) :- setof((Start,End),next_battle_of_tsushima(Start,End),AllINtervals), checkvalidity(1901,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_tsushima_at_1901'), (next_battle_of_tsushima_at_1901(true) -> write('\nRes   = true');write('\nRes   = false')).

