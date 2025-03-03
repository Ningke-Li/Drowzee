:- include('database.pl').
ev_2002_03_fa_premier_league(Start,End) :- begin('ev_2002_03_fa_premier_league',_,_,Start), end('ev_2002_03_fa_premier_league',_,_,End), Start=<End.

finally_ev_2002_03_fa_premier_league_during_10_20(Start,End) :- ev_2002_03_fa_premier_league(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

finally_ev_2002_03_fa_premier_league_during_10_20_at_1982(Res) :- setof((Start,End),finally_ev_2002_03_fa_premier_league_during_10_20(Start,End),AllINtervals), checkvalidity(1982,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2002_03_fa_premier_league_during_10_20_at_1982'), (finally_ev_2002_03_fa_premier_league_during_10_20_at_1982(true) -> write('\nRes   = true');write('\nRes   = false')).

