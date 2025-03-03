:- include('database.pl').
battle_of_sardarabad(Start,End) :- begin('battle_of_sardarabad',_,_,Start), end('battle_of_sardarabad',_,_,End), Start=<End.

next_battle_of_sardarabad(Start,End) :- battle_of_sardarabad(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_sardarabad_at_1917(Res) :- setof((Start,End),next_battle_of_sardarabad(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_sardarabad_at_1917'), (next_battle_of_sardarabad_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

