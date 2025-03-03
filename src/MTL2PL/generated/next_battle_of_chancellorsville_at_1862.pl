:- include('database.pl').
battle_of_chancellorsville(Start,End) :- begin('battle_of_chancellorsville',_,_,Start), end('battle_of_chancellorsville',_,_,End), Start=<End.

next_battle_of_chancellorsville(Start,End) :- battle_of_chancellorsville(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_chancellorsville_at_1862(Res) :- setof((Start,End),next_battle_of_chancellorsville(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_chancellorsville_at_1862'), (next_battle_of_chancellorsville_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).

