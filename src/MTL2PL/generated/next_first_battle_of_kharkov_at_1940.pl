:- include('database.pl').
first_battle_of_kharkov(Start,End) :- begin('first_battle_of_kharkov',_,_,Start), end('first_battle_of_kharkov',_,_,End), Start=<End.

next_first_battle_of_kharkov(Start,End) :- first_battle_of_kharkov(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_first_battle_of_kharkov_at_1940(Res) :- setof((Start,End),next_first_battle_of_kharkov(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = next_first_battle_of_kharkov_at_1940'), (next_first_battle_of_kharkov_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).

