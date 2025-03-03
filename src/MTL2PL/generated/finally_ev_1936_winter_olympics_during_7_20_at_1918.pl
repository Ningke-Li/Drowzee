:- include('database.pl').
ev_1936_winter_olympics(Start,End) :- begin('ev_1936_winter_olympics',_,_,Start), end('ev_1936_winter_olympics',_,_,End), Start=<End.

finally_ev_1936_winter_olympics_during_7_20(Start,End) :- ev_1936_winter_olympics(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

finally_ev_1936_winter_olympics_during_7_20_at_1918(Res) :- setof((Start,End),finally_ev_1936_winter_olympics_during_7_20(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1936_winter_olympics_during_7_20_at_1918'), (finally_ev_1936_winter_olympics_during_7_20_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

