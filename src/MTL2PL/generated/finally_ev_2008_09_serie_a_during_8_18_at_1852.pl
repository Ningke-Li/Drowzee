:- include('database.pl').
ev_2008_09_serie_a(Start,End) :- begin('ev_2008_09_serie_a',_,_,Start), end('ev_2008_09_serie_a',_,_,End), Start=<End.

finally_ev_2008_09_serie_a_during_8_18(Start,End) :- ev_2008_09_serie_a(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_ev_2008_09_serie_a_during_8_18_at_1852(Res) :- setof((Start,End),finally_ev_2008_09_serie_a_during_8_18(Start,End),AllINtervals), checkvalidity(1852,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2008_09_serie_a_during_8_18_at_1852'), (finally_ev_2008_09_serie_a_during_8_18_at_1852(true) -> write('\nRes   = true');write('\nRes   = false')).

