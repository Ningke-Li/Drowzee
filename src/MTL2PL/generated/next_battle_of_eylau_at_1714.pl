:- include('database.pl').
battle_of_eylau(Start,End) :- begin('battle_of_eylau',_,_,Start), end('battle_of_eylau',_,_,End), Start=<End.

next_battle_of_eylau(Start,End) :- battle_of_eylau(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_eylau_at_1714(Res) :- setof((Start,End),next_battle_of_eylau(Start,End),AllINtervals), checkvalidity(1714,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_eylau_at_1714'), (next_battle_of_eylau_at_1714(true) -> write('\nRes   = true');write('\nRes   = false')).

