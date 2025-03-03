:- include('database.pl').
october_revolution(Start,End) :- begin('october_revolution',_,_,Start), end('october_revolution',_,_,End), Start=<End.

next_october_revolution(Start,End) :- october_revolution(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_october_revolution_at_1797(Res) :- setof((Start,End),next_october_revolution(Start,End),AllINtervals), checkvalidity(1797,AllINtervals,Res).

check_query() :- write('Query = next_october_revolution_at_1797'), (next_october_revolution_at_1797(true) -> write('\nRes   = true');write('\nRes   = false')).

