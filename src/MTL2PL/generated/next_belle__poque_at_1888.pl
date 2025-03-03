:- include('database.pl').
belle__poque(Start,End) :- begin('belle__poque',_,_,Start), end('belle__poque',_,_,End), Start=<End.

next_belle__poque(Start,End) :- belle__poque(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_belle__poque_at_1888(Res) :- setof((Start,End),next_belle__poque(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = next_belle__poque_at_1888'), (next_belle__poque_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

