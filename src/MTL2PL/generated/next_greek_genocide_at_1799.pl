:- include('database.pl').
greek_genocide(Start,End) :- begin('greek_genocide',_,_,Start), end('greek_genocide',_,_,End), Start=<End.

next_greek_genocide(Start,End) :- greek_genocide(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_greek_genocide_at_1799(Res) :- setof((Start,End),next_greek_genocide(Start,End),AllINtervals), checkvalidity(1799,AllINtervals,Res).

check_query() :- write('Query = next_greek_genocide_at_1799'), (next_greek_genocide_at_1799(true) -> write('\nRes   = true');write('\nRes   = false')).

