:- include('database.pl').
ev_1939_south_american_championship(Start,End) :- begin('ev_1939_south_american_championship',_,_,Start), end('ev_1939_south_american_championship',_,_,End), Start=<End.

next_ev_1939_south_american_championship(Start,End) :- ev_1939_south_american_championship(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1939_south_american_championship_at_1938(Res) :- setof((Start,End),next_ev_1939_south_american_championship(Start,End),AllINtervals), checkvalidity(1938,AllINtervals,Res).

check_query() :- write('Query = next_ev_1939_south_american_championship_at_1938'), (next_ev_1939_south_american_championship_at_1938(true) -> write('\nRes   = true');write('\nRes   = false')).

