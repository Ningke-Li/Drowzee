:- include('database.pl').
ev_2014_winter_paralympics(Start,End) :- begin('ev_2014_winter_paralympics',_,_,Start), end('ev_2014_winter_paralympics',_,_,End), Start=<End.

finally_ev_2014_winter_paralympics_during_10_20(Start,End) :- ev_2014_winter_paralympics(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

finally_ev_2014_winter_paralympics_during_10_20_at_1921(Res) :- setof((Start,End),finally_ev_2014_winter_paralympics_during_10_20(Start,End),AllINtervals), checkvalidity(1921,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_winter_paralympics_during_10_20_at_1921'), (finally_ev_2014_winter_paralympics_during_10_20_at_1921(true) -> write('\nRes   = true');write('\nRes   = false')).

