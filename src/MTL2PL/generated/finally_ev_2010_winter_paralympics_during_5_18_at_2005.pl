:- include('database.pl').
ev_2010_winter_paralympics(Start,End) :- begin('ev_2010_winter_paralympics',_,_,Start), end('ev_2010_winter_paralympics',_,_,End), Start=<End.

finally_ev_2010_winter_paralympics_during_5_18(Start,End) :- ev_2010_winter_paralympics(Start1,End1), (Start1-18)=<(End1-5), Start is (Start1-18), End is (End1-5), Start=<End.

finally_ev_2010_winter_paralympics_during_5_18_at_2005(Res) :- setof((Start,End),finally_ev_2010_winter_paralympics_during_5_18(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_winter_paralympics_during_5_18_at_2005'), (finally_ev_2010_winter_paralympics_during_5_18_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

