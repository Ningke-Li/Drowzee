:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

ev_2012_13_premier_league(Start,End) :- begin('ev_2012_13_premier_league',_,_,Start), end('ev_2012_13_premier_league',_,_,End), Start=<End.

latvian_lats_last_till_7_14(Start,End) :- latvian_lats(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

latvian_lats_until_ev_2012_13_premier_league_during_7_14_overlap(Start,End) :- latvian_lats_last_till_7_14(Start1,End1), ev_2012_13_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

latvian_lats_until_ev_2012_13_premier_league_during_7_14(Start,End) :- latvian_lats(W1,_), latvian_lats_until_ev_2012_13_premier_league_during_7_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-7), Start=<End.

latvian_lats_until_ev_2012_13_premier_league_during_7_14_at_1999(Res) :- setof((Start,End),latvian_lats_until_ev_2012_13_premier_league_during_7_14(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = latvian_lats_until_ev_2012_13_premier_league_during_7_14_at_1999'), (latvian_lats_until_ev_2012_13_premier_league_during_7_14_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

