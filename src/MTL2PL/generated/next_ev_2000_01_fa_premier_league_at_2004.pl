:- include('database.pl').
ev_2000_01_fa_premier_league(Start,End) :- begin('ev_2000_01_fa_premier_league',_,_,Start), end('ev_2000_01_fa_premier_league',_,_,End), Start=<End.

next_ev_2000_01_fa_premier_league(Start,End) :- ev_2000_01_fa_premier_league(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2000_01_fa_premier_league_at_2004(Res) :- setof((Start,End),next_ev_2000_01_fa_premier_league(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = next_ev_2000_01_fa_premier_league_at_2004'), (next_ev_2000_01_fa_premier_league_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

