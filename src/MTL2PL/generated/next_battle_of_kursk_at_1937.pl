:- include('database.pl').
battle_of_kursk(Start,End) :- begin('battle_of_kursk',_,_,Start), end('battle_of_kursk',_,_,End), Start=<End.

next_battle_of_kursk(Start,End) :- battle_of_kursk(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_kursk_at_1937(Res) :- setof((Start,End),next_battle_of_kursk(Start,End),AllINtervals), checkvalidity(1937,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_kursk_at_1937'), (next_battle_of_kursk_at_1937(true) -> write('\nRes   = true');write('\nRes   = false')).

