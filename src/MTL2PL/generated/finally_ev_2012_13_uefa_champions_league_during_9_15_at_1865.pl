:- include('database.pl').
ev_2012_13_uefa_champions_league(Start,End) :- begin('ev_2012_13_uefa_champions_league',_,_,Start), end('ev_2012_13_uefa_champions_league',_,_,End), Start=<End.

finally_ev_2012_13_uefa_champions_league_during_9_15(Start,End) :- ev_2012_13_uefa_champions_league(Start1,End1), (Start1-15)=<(End1-9), Start is (Start1-15), End is (End1-9), Start=<End.

finally_ev_2012_13_uefa_champions_league_during_9_15_at_1865(Res) :- setof((Start,End),finally_ev_2012_13_uefa_champions_league_during_9_15(Start,End),AllINtervals), checkvalidity(1865,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_13_uefa_champions_league_during_9_15_at_1865'), (finally_ev_2012_13_uefa_champions_league_during_9_15_at_1865(true) -> write('\nRes   = true');write('\nRes   = false')).

