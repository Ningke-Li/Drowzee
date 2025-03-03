:- include('database.pl').
ev_24(Start,End) :- begin('ev_24',_,_,Start), end('ev_24',_,_,End), Start=<End.

ev_2004_05_fa_premier_league(Start,End) :- begin('ev_2004_05_fa_premier_league',_,_,Start), end('ev_2004_05_fa_premier_league',_,_,End), Start=<End.

ev_24_last_till_2_8(Start,End) :- ev_24(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ev_24_until_ev_2004_05_fa_premier_league_during_2_8_overlap(Start,End) :- ev_24_last_till_2_8(Start1,End1), ev_2004_05_fa_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_24_until_ev_2004_05_fa_premier_league_during_2_8(Start,End) :- ev_24(W1,_), ev_24_until_ev_2004_05_fa_premier_league_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

ev_24_until_ev_2004_05_fa_premier_league_during_2_8_at_1888(Res) :- setof((Start,End),ev_24_until_ev_2004_05_fa_premier_league_during_2_8(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = ev_24_until_ev_2004_05_fa_premier_league_during_2_8_at_1888'), (ev_24_until_ev_2004_05_fa_premier_league_during_2_8_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

