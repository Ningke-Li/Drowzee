:- include('database.pl').
latvian_lats(Start,End) :- begin('latvian_lats',_,_,Start), end('latvian_lats',_,_,End), Start=<End.

ev_2006_07_uefa_champions_league(Start,End) :- begin('ev_2006_07_uefa_champions_league',_,_,Start), end('ev_2006_07_uefa_champions_league',_,_,End), Start=<End.

latvian_lats_last_till_8_9(Start,End) :- latvian_lats(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

latvian_lats_until_ev_2006_07_uefa_champions_league_during_8_9_overlap(Start,End) :- latvian_lats_last_till_8_9(Start1,End1), ev_2006_07_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

latvian_lats_until_ev_2006_07_uefa_champions_league_during_8_9(Start,End) :- latvian_lats(W1,_), latvian_lats_until_ev_2006_07_uefa_champions_league_during_8_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-8), Start=<End.

latvian_lats_until_ev_2006_07_uefa_champions_league_during_8_9_at_1979(Res) :- setof((Start,End),latvian_lats_until_ev_2006_07_uefa_champions_league_during_8_9(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = latvian_lats_until_ev_2006_07_uefa_champions_league_during_8_9_at_1979'), (latvian_lats_until_ev_2006_07_uefa_champions_league_during_8_9_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

