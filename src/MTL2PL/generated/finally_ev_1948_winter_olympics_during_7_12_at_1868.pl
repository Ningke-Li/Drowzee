:- include('database.pl').
ev_1948_winter_olympics(Start,End) :- begin('ev_1948_winter_olympics',_,_,Start), end('ev_1948_winter_olympics',_,_,End), Start=<End.

finally_ev_1948_winter_olympics_during_7_12(Start,End) :- ev_1948_winter_olympics(Start1,End1), (Start1-12)=<(End1-7), Start is (Start1-12), End is (End1-7), Start=<End.

finally_ev_1948_winter_olympics_during_7_12_at_1868(Res) :- setof((Start,End),finally_ev_1948_winter_olympics_during_7_12(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1948_winter_olympics_during_7_12_at_1868'), (finally_ev_1948_winter_olympics_during_7_12_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).

