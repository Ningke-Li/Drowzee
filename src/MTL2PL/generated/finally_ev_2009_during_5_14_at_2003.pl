:- include('database.pl').
ev_2009(Start,End) :- begin('ev_2009',_,_,Start), end('ev_2009',_,_,End), Start=<End.

finally_ev_2009_during_5_14(Start,End) :- ev_2009(Start1,End1), (Start1-14)=<(End1-5), Start is (Start1-14), End is (End1-5), Start=<End.

finally_ev_2009_during_5_14_at_2003(Res) :- setof((Start,End),finally_ev_2009_during_5_14(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_during_5_14_at_2003'), (finally_ev_2009_during_5_14_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

