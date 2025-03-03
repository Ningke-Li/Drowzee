:- include('database.pl').
castle(Start,End) :- begin('castle',_,_,Start), end('castle',_,_,End), Start=<End.

next_castle(Start,End) :- castle(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_castle_at_2011(Res) :- setof((Start,End),next_castle(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = next_castle_at_2011'), (next_castle_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

