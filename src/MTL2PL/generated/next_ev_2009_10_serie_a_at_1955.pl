:- include('database.pl').
ev_2009_10_serie_a(Start,End) :- begin('ev_2009_10_serie_a',_,_,Start), end('ev_2009_10_serie_a',_,_,End), Start=<End.

next_ev_2009_10_serie_a(Start,End) :- ev_2009_10_serie_a(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2009_10_serie_a_at_1955(Res) :- setof((Start,End),next_ev_2009_10_serie_a(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = next_ev_2009_10_serie_a_at_1955'), (next_ev_2009_10_serie_a_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).

