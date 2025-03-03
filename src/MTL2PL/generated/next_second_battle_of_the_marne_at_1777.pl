:- include('database.pl').
second_battle_of_the_marne(Start,End) :- begin('second_battle_of_the_marne',_,_,Start), end('second_battle_of_the_marne',_,_,End), Start=<End.

next_second_battle_of_the_marne(Start,End) :- second_battle_of_the_marne(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_second_battle_of_the_marne_at_1777(Res) :- setof((Start,End),next_second_battle_of_the_marne(Start,End),AllINtervals), checkvalidity(1777,AllINtervals,Res).

check_query() :- write('Query = next_second_battle_of_the_marne_at_1777'), (next_second_battle_of_the_marne_at_1777(true) -> write('\nRes   = true');write('\nRes   = false')).

