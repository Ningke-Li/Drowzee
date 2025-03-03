:- include('database.pl').
ev_2000_summer_paralympics(Start,End) :- begin('ev_2000_summer_paralympics',_,_,Start), end('ev_2000_summer_paralympics',_,_,End), Start=<End.

finally_ev_2000_summer_paralympics_during_7_15(Start,End) :- ev_2000_summer_paralympics(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_ev_2000_summer_paralympics_during_7_15_at_1991(Res) :- setof((Start,End),finally_ev_2000_summer_paralympics_during_7_15(Start,End),AllINtervals), checkvalidity(1991,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2000_summer_paralympics_during_7_15_at_1991'), (finally_ev_2000_summer_paralympics_during_7_15_at_1991(true) -> write('\nRes   = true');write('\nRes   = false')).

