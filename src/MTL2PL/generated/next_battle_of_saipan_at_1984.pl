:- include('database.pl').
battle_of_saipan(Start,End) :- begin('battle_of_saipan',_,_,Start), end('battle_of_saipan',_,_,End), Start=<End.

next_battle_of_saipan(Start,End) :- battle_of_saipan(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_saipan_at_1984(Res) :- setof((Start,End),next_battle_of_saipan(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_saipan_at_1984'), (next_battle_of_saipan_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

