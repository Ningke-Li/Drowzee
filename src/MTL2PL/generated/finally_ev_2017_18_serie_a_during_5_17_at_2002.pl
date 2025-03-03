:- include('database.pl').
ev_2017_18_serie_a(Start,End) :- begin('ev_2017_18_serie_a',_,_,Start), end('ev_2017_18_serie_a',_,_,End), Start=<End.

finally_ev_2017_18_serie_a_during_5_17(Start,End) :- ev_2017_18_serie_a(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_ev_2017_18_serie_a_during_5_17_at_2002(Res) :- setof((Start,End),finally_ev_2017_18_serie_a_during_5_17(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2017_18_serie_a_during_5_17_at_2002'), (finally_ev_2017_18_serie_a_during_5_17_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

