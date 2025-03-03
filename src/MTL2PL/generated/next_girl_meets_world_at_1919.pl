:- include('database.pl').
girl_meets_world(Start,End) :- begin('girl_meets_world',_,_,Start), end('girl_meets_world',_,_,End), Start=<End.

next_girl_meets_world(Start,End) :- girl_meets_world(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_girl_meets_world_at_1919(Res) :- setof((Start,End),next_girl_meets_world(Start,End),AllINtervals), checkvalidity(1919,AllINtervals,Res).

check_query() :- write('Query = next_girl_meets_world_at_1919'), (next_girl_meets_world_at_1919(true) -> write('\nRes   = true');write('\nRes   = false')).

