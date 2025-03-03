:- include('database.pl').
ev_2001_02_fa_premier_league(Start,End) :- begin('ev_2001_02_fa_premier_league',_,_,Start), end('ev_2001_02_fa_premier_league',_,_,End), Start=<End.

finally_ev_2001_02_fa_premier_league_during_5_17(Start,End) :- ev_2001_02_fa_premier_league(Start1,End1), (Start1-17)=<(End1-5), Start is (Start1-17), End is (End1-5), Start=<End.

finally_ev_2001_02_fa_premier_league_during_5_17_at_1920(Res) :- setof((Start,End),finally_ev_2001_02_fa_premier_league_during_5_17(Start,End),AllINtervals), checkvalidity(1920,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2001_02_fa_premier_league_during_5_17_at_1920'), (finally_ev_2001_02_fa_premier_league_during_5_17_at_1920(true) -> write('\nRes   = true');write('\nRes   = false')).

