:- include('database.pl').
ev_1936_summer_olympics(Start,End) :- begin('ev_1936_summer_olympics',_,_,Start), end('ev_1936_summer_olympics',_,_,End), Start=<End.

finally_ev_1936_summer_olympics_during_3_11(Start,End) :- ev_1936_summer_olympics(Start1,End1), (Start1-11)=<(End1-3), Start is (Start1-11), End is (End1-3), Start=<End.

finally_ev_1936_summer_olympics_during_3_11_at_1928(Res) :- setof((Start,End),finally_ev_1936_summer_olympics_during_3_11(Start,End),AllINtervals), checkvalidity(1928,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1936_summer_olympics_during_3_11_at_1928'), (finally_ev_1936_summer_olympics_during_3_11_at_1928(true) -> write('\nRes   = true');write('\nRes   = false')).

