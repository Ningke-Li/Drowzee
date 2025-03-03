:- include('database.pl').
ev_2016_17_serie_a(Start,End) :- begin('ev_2016_17_serie_a',_,_,Start), end('ev_2016_17_serie_a',_,_,End), Start=<End.

finally_ev_2016_17_serie_a_during_3_15(Start,End) :- ev_2016_17_serie_a(Start1,End1), (Start1-15)=<(End1-3), Start is (Start1-15), End is (End1-3), Start=<End.

finally_ev_2016_17_serie_a_during_3_15_at_2002(Res) :- setof((Start,End),finally_ev_2016_17_serie_a_during_3_15(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2016_17_serie_a_during_3_15_at_2002'), (finally_ev_2016_17_serie_a_during_3_15_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

