:- include('database.pl').
ev_2012_13_uefa_champions_league(Start,End) :- begin('ev_2012_13_uefa_champions_league',_,_,Start), end('ev_2012_13_uefa_champions_league',_,_,End), Start=<End.

finally_ev_2012_13_uefa_champions_league_during_4_16(Start,End) :- ev_2012_13_uefa_champions_league(Start1,End1), (Start1-16)=<(End1-4), Start is (Start1-16), End is (End1-4), Start=<End.

finally_ev_2012_13_uefa_champions_league_during_4_16_at_1989(Res) :- setof((Start,End),finally_ev_2012_13_uefa_champions_league_during_4_16(Start,End),AllINtervals), checkvalidity(1989,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_13_uefa_champions_league_during_4_16_at_1989'), (finally_ev_2012_13_uefa_champions_league_during_4_16_at_1989(true) -> write('\nRes   = true');write('\nRes   = false')).

