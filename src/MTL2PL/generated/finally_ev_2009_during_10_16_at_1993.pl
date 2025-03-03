:- include('database.pl').
ev_2009(Start,End) :- begin('ev_2009',_,_,Start), end('ev_2009',_,_,End), Start=<End.

finally_ev_2009_during_10_16(Start,End) :- ev_2009(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_ev_2009_during_10_16_at_1993(Res) :- setof((Start,End),finally_ev_2009_during_10_16(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_during_10_16_at_1993'), (finally_ev_2009_during_10_16_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

