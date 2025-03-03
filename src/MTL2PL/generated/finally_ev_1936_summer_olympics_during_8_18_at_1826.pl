:- include('database.pl').
ev_1936_summer_olympics(Start,End) :- begin('ev_1936_summer_olympics',_,_,Start), end('ev_1936_summer_olympics',_,_,End), Start=<End.

finally_ev_1936_summer_olympics_during_8_18(Start,End) :- ev_1936_summer_olympics(Start1,End1), (Start1-18)=<(End1-8), Start is (Start1-18), End is (End1-8), Start=<End.

finally_ev_1936_summer_olympics_during_8_18_at_1826(Res) :- setof((Start,End),finally_ev_1936_summer_olympics_during_8_18(Start,End),AllINtervals), checkvalidity(1826,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1936_summer_olympics_during_8_18_at_1826'), (finally_ev_1936_summer_olympics_during_8_18_at_1826(true) -> write('\nRes   = true');write('\nRes   = false')).

