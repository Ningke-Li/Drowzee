:- include('database.pl').
taiping_rebellion(Start,End) :- begin('taiping_rebellion',_,_,Start), end('taiping_rebellion',_,_,End), Start=<End.

next_taiping_rebellion(Start,End) :- taiping_rebellion(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_taiping_rebellion_at_1763(Res) :- setof((Start,End),next_taiping_rebellion(Start,End),AllINtervals), checkvalidity(1763,AllINtervals,Res).

check_query() :- write('Query = next_taiping_rebellion_at_1763'), (next_taiping_rebellion_at_1763(true) -> write('\nRes   = true');write('\nRes   = false')).

