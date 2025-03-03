:- include('database.pl').
battle_of_wagram(Start,End) :- begin('battle_of_wagram',_,_,Start), end('battle_of_wagram',_,_,End), Start=<End.

next_battle_of_wagram(Start,End) :- battle_of_wagram(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_battle_of_wagram_at_1848(Res) :- setof((Start,End),next_battle_of_wagram(Start,End),AllINtervals), checkvalidity(1848,AllINtervals,Res).

check_query() :- write('Query = next_battle_of_wagram_at_1848'), (next_battle_of_wagram_at_1848(true) -> write('\nRes   = true');write('\nRes   = false')).

