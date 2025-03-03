:- include('database.pl').
lateran_treaty(Start,End) :- begin('lateran_treaty',_,_,Start), end('lateran_treaty',_,_,End), Start=<End.

next_lateran_treaty(Start,End) :- lateran_treaty(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_lateran_treaty_at_1980(Res) :- setof((Start,End),next_lateran_treaty(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = next_lateran_treaty_at_1980'), (next_lateran_treaty_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).

