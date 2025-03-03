:- include('database.pl').
blindspot(Start,End) :- begin('blindspot',_,_,Start), end('blindspot',_,_,End), Start=<End.

next_blindspot(Start,End) :- blindspot(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_blindspot_at_2019(Res) :- setof((Start,End),next_blindspot(Start,End),AllINtervals), checkvalidity(2019,AllINtervals,Res).

check_query() :- write('Query = next_blindspot_at_2019'), (next_blindspot_at_2019(true) -> write('\nRes   = true');write('\nRes   = false')).

