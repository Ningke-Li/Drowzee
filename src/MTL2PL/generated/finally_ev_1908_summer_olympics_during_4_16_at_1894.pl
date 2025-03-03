:- include('database.pl').
ev_1908_summer_olympics(Start,End) :- begin('ev_1908_summer_olympics',_,_,Start), end('ev_1908_summer_olympics',_,_,End), Start=<End.

finally_ev_1908_summer_olympics_during_4_16(Start,End) :- ev_1908_summer_olympics(Start1,End1), (Start1-16)=<(End1-4), Start is (Start1-16), End is (End1-4), Start=<End.

finally_ev_1908_summer_olympics_during_4_16_at_1894(Res) :- setof((Start,End),finally_ev_1908_summer_olympics_during_4_16(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1908_summer_olympics_during_4_16_at_1894'), (finally_ev_1908_summer_olympics_during_4_16_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).

