:- include('database.pl').
ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

finally_ev_2012_13_uefa_europa_league_during_1_15(Start,End) :- ev_2012_13_uefa_europa_league(Start1,End1), (Start1-15)=<(End1-1), Start is (Start1-15), End is (End1-1), Start=<End.

finally_ev_2012_13_uefa_europa_league_during_1_15_at_2037(Res) :- setof((Start,End),finally_ev_2012_13_uefa_europa_league_during_1_15(Start,End),AllINtervals), checkvalidity(2037,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_13_uefa_europa_league_during_1_15_at_2037'), (finally_ev_2012_13_uefa_europa_league_during_1_15_at_2037(true) -> write('\nRes   = true');write('\nRes   = false')).

