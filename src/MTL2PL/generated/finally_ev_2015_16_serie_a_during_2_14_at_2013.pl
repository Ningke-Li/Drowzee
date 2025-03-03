:- include('database.pl').
ev_2015_16_serie_a(Start,End) :- begin('ev_2015_16_serie_a',_,_,Start), end('ev_2015_16_serie_a',_,_,End), Start=<End.

finally_ev_2015_16_serie_a_during_2_14(Start,End) :- ev_2015_16_serie_a(Start1,End1), (Start1-14)=<(End1-2), Start is (Start1-14), End is (End1-2), Start=<End.

finally_ev_2015_16_serie_a_during_2_14_at_2013(Res) :- setof((Start,End),finally_ev_2015_16_serie_a_during_2_14(Start,End),AllINtervals), checkvalidity(2013,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_16_serie_a_during_2_14_at_2013'), (finally_ev_2015_16_serie_a_during_2_14_at_2013(true) -> write('\nRes   = true');write('\nRes   = false')).

