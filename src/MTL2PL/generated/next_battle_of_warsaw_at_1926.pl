:- include('database.pl').
battle_of_warsaw(Start,End) :- begin('battle_of_warsaw',_,_,Start), end('battle_of_warsaw',_,_,End), Start=<End.

next_battle_of_warsaw(Start,End) :- battle_of_warsaw(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_warsaw_at_1926(Res) :- setof((Start,End),next_battle_of_warsaw(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_warsaw_at_1926'), (next_battle_of_warsaw_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).

