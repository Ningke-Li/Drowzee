:- include('database.pl').
ev_2007_08_uefa_champions_league(Start,End) :- begin('ev_2007_08_uefa_champions_league',_,_,Start), end('ev_2007_08_uefa_champions_league',_,_,End), Start=<End.

finally_ev_2007_08_uefa_champions_league_during_1_11(Start,End) :- ev_2007_08_uefa_champions_league(Start1,End1), (Start1-11)=<(End1-1), Start is (Start1-11), End is (End1-1), Start=<End.

finally_ev_2007_08_uefa_champions_league_during_1_11_at_1884(Res) :- setof((Start,End),finally_ev_2007_08_uefa_champions_league_during_1_11(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2007_08_uefa_champions_league_during_1_11_at_1884'), (finally_ev_2007_08_uefa_champions_league_during_1_11_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

