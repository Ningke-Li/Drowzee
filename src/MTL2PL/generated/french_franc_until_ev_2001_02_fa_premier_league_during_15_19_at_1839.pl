:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

ev_2001_02_fa_premier_league(Start,End) :- begin('ev_2001_02_fa_premier_league',_,_,Start), end('ev_2001_02_fa_premier_league',_,_,End), Start=<End.

french_franc_last_till_15_19(Start,End) :- french_franc(Start1,End1), (End1-Start1)>=15, Start is (Start1+15), End is (End1+1).

french_franc_until_ev_2001_02_fa_premier_league_during_15_19_overlap(Start,End) :- french_franc_last_till_15_19(Start1,End1), ev_2001_02_fa_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

french_franc_until_ev_2001_02_fa_premier_league_during_15_19(Start,End) :- french_franc(W1,_), french_franc_until_ev_2001_02_fa_premier_league_during_15_19_overlap(Start1,End1), Start is max((Start1-19),W1), End is (End1-15), Start=<End.

french_franc_until_ev_2001_02_fa_premier_league_during_15_19_at_1839(Res) :- setof((Start,End),french_franc_until_ev_2001_02_fa_premier_league_during_15_19(Start,End),AllINtervals), checkvalidity(1839,AllINtervals,Res).

check_query() :- write('Query = french_franc_until_ev_2001_02_fa_premier_league_during_15_19_at_1839'), (french_franc_until_ev_2001_02_fa_premier_league_during_15_19_at_1839(true) -> write('\nRes   = true');write('\nRes   = false')).

