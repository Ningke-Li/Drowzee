:- include('database.pl').
siege_of_osaka(Start,End) :- begin('siege_of_osaka',_,_,Start), end('siege_of_osaka',_,_,End), Start=<End.

next_siege_of_osaka(Start,End) :- siege_of_osaka(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_siege_of_osaka_at_1498(Res) :- setof((Start,End),next_siege_of_osaka(Start,End),AllINtervals), checkvalidity(1498,AllINtervals,Res).

check_query() :- write('Query = next_siege_of_osaka_at_1498'), (next_siege_of_osaka_at_1498(true) -> write('\nRes   = true');write('\nRes   = false')).

