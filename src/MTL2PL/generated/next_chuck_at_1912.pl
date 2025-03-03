:- include('database.pl').
chuck(Start,End) :- begin('chuck',_,_,Start), end('chuck',_,_,End), Start=<End.

next_chuck(Start,End) :- chuck(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_chuck_at_1912(Res) :- setof((Start,End),next_chuck(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = next_chuck_at_1912'), (next_chuck_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).

