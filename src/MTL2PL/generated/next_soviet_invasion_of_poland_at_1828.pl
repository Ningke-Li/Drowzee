:- include('database.pl').
soviet_invasion_of_poland(Start,End) :- begin('soviet_invasion_of_poland',_,_,Start), end('soviet_invasion_of_poland',_,_,End), Start=<End.

next_soviet_invasion_of_poland(Start,End) :- soviet_invasion_of_poland(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_soviet_invasion_of_poland_at_1828(Res) :- setof((Start,End),next_soviet_invasion_of_poland(Start,End),AllINtervals), checkvalidity(1828,AllINtervals,Res).

check_query() :- write('Query = next_soviet_invasion_of_poland_at_1828'), (next_soviet_invasion_of_poland_at_1828(true) -> write('\nRes   = true');write('\nRes   = false')).

