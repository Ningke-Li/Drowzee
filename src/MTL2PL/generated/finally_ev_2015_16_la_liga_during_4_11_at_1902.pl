:- include('database.pl').
ev_2015_16_la_liga(Start,End) :- begin('ev_2015_16_la_liga',_,_,Start), end('ev_2015_16_la_liga',_,_,End), Start=<End.

finally_ev_2015_16_la_liga_during_4_11(Start,End) :- ev_2015_16_la_liga(Start1,End1), (Start1-11)=<(End1-4), Start is (Start1-11), End is (End1-4), Start=<End.

finally_ev_2015_16_la_liga_during_4_11_at_1902(Res) :- setof((Start,End),finally_ev_2015_16_la_liga_during_4_11(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_16_la_liga_during_4_11_at_1902'), (finally_ev_2015_16_la_liga_during_4_11_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

