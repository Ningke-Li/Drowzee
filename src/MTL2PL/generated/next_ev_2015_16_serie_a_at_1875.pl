:- include('database.pl').
ev_2015_16_serie_a(Start,End) :- begin('ev_2015_16_serie_a',_,_,Start), end('ev_2015_16_serie_a',_,_,End), Start=<End.

next_ev_2015_16_serie_a(Start,End) :- ev_2015_16_serie_a(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2015_16_serie_a_at_1875(Res) :- setof((Start,End),next_ev_2015_16_serie_a(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = next_ev_2015_16_serie_a_at_1875'), (next_ev_2015_16_serie_a_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

