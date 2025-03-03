:- include('database.pl').
xinhai_revolution(Start,End) :- begin('xinhai_revolution',_,_,Start), end('xinhai_revolution',_,_,End), Start=<End.

next_xinhai_revolution(Start,End) :- xinhai_revolution(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_xinhai_revolution_at_1910(Res) :- setof((Start,End),next_xinhai_revolution(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = next_xinhai_revolution_at_1910'), (next_xinhai_revolution_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).

