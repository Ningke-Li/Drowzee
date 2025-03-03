:- include('database.pl').
ev_2000_summer_olympics(Start,End) :- begin('ev_2000_summer_olympics',_,_,Start), end('ev_2000_summer_olympics',_,_,End), Start=<End.

finally_ev_2000_summer_olympics_during_7_15(Start,End) :- ev_2000_summer_olympics(Start1,End1), (Start1-15)=<(End1-7), Start is (Start1-15), End is (End1-7), Start=<End.

finally_ev_2000_summer_olympics_during_7_15_at_1993(Res) :- setof((Start,End),finally_ev_2000_summer_olympics_during_7_15(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2000_summer_olympics_during_7_15_at_1993'), (finally_ev_2000_summer_olympics_during_7_15_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

