:- include('database.pl').
japanese_invasions_of_korea(Start,End) :- begin('japanese_invasions_of_korea',_,_,Start), end('japanese_invasions_of_korea',_,_,End), Start=<End.

next_japanese_invasions_of_korea(Start,End) :- japanese_invasions_of_korea(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_japanese_invasions_of_korea_at_1512(Res) :- setof((Start,End),next_japanese_invasions_of_korea(Start,End),AllINtervals), checkvalidity(1512,AllINtervals,Res).

check_query() :- write('Query = next_japanese_invasions_of_korea_at_1512'), (next_japanese_invasions_of_korea_at_1512(true) -> write('\nRes   = true');write('\nRes   = false')).

