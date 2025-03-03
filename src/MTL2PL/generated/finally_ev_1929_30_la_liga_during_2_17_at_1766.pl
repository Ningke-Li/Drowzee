:- include('database.pl').
ev_1929_30_la_liga(Start,End) :- begin('ev_1929_30_la_liga',_,_,Start), end('ev_1929_30_la_liga',_,_,End), Start=<End.

finally_ev_1929_30_la_liga_during_2_17(Start,End) :- ev_1929_30_la_liga(Start1,End1), (Start1-17)=<(End1-2), Start is (Start1-17), End is (End1-2), Start=<End.

finally_ev_1929_30_la_liga_during_2_17_at_1766(Res) :- setof((Start,End),finally_ev_1929_30_la_liga_during_2_17(Start,End),AllINtervals), checkvalidity(1766,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1929_30_la_liga_during_2_17_at_1766'), (finally_ev_1929_30_la_liga_during_2_17_at_1766(true) -> write('\nRes   = true');write('\nRes   = false')).

