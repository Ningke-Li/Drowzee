:- include('database.pl').
ev_2010_11_serie_a(Start,End) :- begin('ev_2010_11_serie_a',_,_,Start), end('ev_2010_11_serie_a',_,_,End), Start=<End.

finally_ev_2010_11_serie_a_during_3_17(Start,End) :- ev_2010_11_serie_a(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

finally_ev_2010_11_serie_a_during_3_17_at_1883(Res) :- setof((Start,End),finally_ev_2010_11_serie_a_during_3_17(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_11_serie_a_during_3_17_at_1883'), (finally_ev_2010_11_serie_a_during_3_17_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).

