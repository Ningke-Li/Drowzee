:- include('database.pl').
circassian_genocide(Start,End) :- begin('circassian_genocide',_,_,Start), end('circassian_genocide',_,_,End), Start=<End.

next_circassian_genocide(Start,End) :- circassian_genocide(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_circassian_genocide_at_1805(Res) :- setof((Start,End),next_circassian_genocide(Start,End),AllINtervals), checkvalidity(1805,AllINtervals,Res).

check_query() :- write('Query = next_circassian_genocide_at_1805'), (next_circassian_genocide_at_1805(true) -> write('\nRes   = true');write('\nRes   = false')).

