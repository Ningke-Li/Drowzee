:- include('database.pl').
ev_2015_16_la_liga(Start,End) :- begin('ev_2015_16_la_liga',_,_,Start), end('ev_2015_16_la_liga',_,_,End), Start=<End.

finally_ev_2015_16_la_liga_during_1_12(Start,End) :- ev_2015_16_la_liga(Start1,End1), (Start1-12)=<(End1-1), Start is (Start1-12), End is (End1-1), Start=<End.

finally_ev_2015_16_la_liga_during_1_12_at_2021(Res) :- setof((Start,End),finally_ev_2015_16_la_liga_during_1_12(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_16_la_liga_during_1_12_at_2021'), (finally_ev_2015_16_la_liga_during_1_12_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).

