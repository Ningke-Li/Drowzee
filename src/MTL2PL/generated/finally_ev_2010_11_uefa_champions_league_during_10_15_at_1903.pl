:- include('database.pl').
ev_2010_11_uefa_champions_league(Start,End) :- begin('ev_2010_11_uefa_champions_league',_,_,Start), end('ev_2010_11_uefa_champions_league',_,_,End), Start=<End.

finally_ev_2010_11_uefa_champions_league_during_10_15(Start,End) :- ev_2010_11_uefa_champions_league(Start1,End1), (Start1-15)=<(End1-10), Start is (Start1-15), End is (End1-10), Start=<End.

finally_ev_2010_11_uefa_champions_league_during_10_15_at_1903(Res) :- setof((Start,End),finally_ev_2010_11_uefa_champions_league_during_10_15(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_11_uefa_champions_league_during_10_15_at_1903'), (finally_ev_2010_11_uefa_champions_league_during_10_15_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).

