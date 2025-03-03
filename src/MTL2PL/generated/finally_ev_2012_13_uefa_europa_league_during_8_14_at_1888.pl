:- include('database.pl').
ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

finally_ev_2012_13_uefa_europa_league_during_8_14(Start,End) :- ev_2012_13_uefa_europa_league(Start1,End1), (Start1-14)=<(End1-8), Start is (Start1-14), End is (End1-8), Start=<End.

finally_ev_2012_13_uefa_europa_league_during_8_14_at_1888(Res) :- setof((Start,End),finally_ev_2012_13_uefa_europa_league_during_8_14(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_13_uefa_europa_league_during_8_14_at_1888'), (finally_ev_2012_13_uefa_europa_league_during_8_14_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

