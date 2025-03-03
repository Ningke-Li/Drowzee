:- include('database.pl').
ev_2004_05_uefa_champions_league(Start,End) :- begin('ev_2004_05_uefa_champions_league',_,_,Start), end('ev_2004_05_uefa_champions_league',_,_,End), Start=<End.

next_ev_2004_05_uefa_champions_league(Start,End) :- ev_2004_05_uefa_champions_league(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2004_05_uefa_champions_league_at_1949(Res) :- setof((Start,End),next_ev_2004_05_uefa_champions_league(Start,End),AllINtervals), checkvalidity(1949,AllINtervals,Res).

check_query() :- write('Query = next_ev_2004_05_uefa_champions_league_at_1949'), (next_ev_2004_05_uefa_champions_league_at_1949(true) -> write('\nRes   = true');write('\nRes   = false')).

