:- include('database.pl').
ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

finally_ev_2012_13_la_liga_during_7_11(Start,End) :- ev_2012_13_la_liga(Start1,End1), (Start1-11)=<(End1-7), Start is (Start1-11), End is (End1-7), Start=<End.

finally_ev_2012_13_la_liga_during_7_11_at_2005(Res) :- setof((Start,End),finally_ev_2012_13_la_liga_during_7_11(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_13_la_liga_during_7_11_at_2005'), (finally_ev_2012_13_la_liga_during_7_11_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

