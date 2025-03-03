:- include('database.pl').
haitian_revolution(Start,End) :- begin('haitian_revolution',_,_,Start), end('haitian_revolution',_,_,End), Start=<End.

next_haitian_revolution(Start,End) :- haitian_revolution(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_haitian_revolution_at_1677(Res) :- setof((Start,End),next_haitian_revolution(Start,End),AllINtervals), checkvalidity(1677,AllINtervals,Res).

check_query() :- write('Query = next_haitian_revolution_at_1677'), (next_haitian_revolution_at_1677(true) -> write('\nRes   = true');write('\nRes   = false')).

