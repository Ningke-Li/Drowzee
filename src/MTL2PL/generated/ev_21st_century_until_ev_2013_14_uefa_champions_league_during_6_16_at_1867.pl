:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

ev_2013_14_uefa_champions_league(Start,End) :- begin('ev_2013_14_uefa_champions_league',_,_,Start), end('ev_2013_14_uefa_champions_league',_,_,End), Start=<End.

ev_21st_century_last_till_6_16(Start,End) :- ev_21st_century(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

ev_21st_century_until_ev_2013_14_uefa_champions_league_during_6_16_overlap(Start,End) :- ev_21st_century_last_till_6_16(Start1,End1), ev_2013_14_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_21st_century_until_ev_2013_14_uefa_champions_league_during_6_16(Start,End) :- ev_21st_century(W1,_), ev_21st_century_until_ev_2013_14_uefa_champions_league_during_6_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-6), Start=<End.

ev_21st_century_until_ev_2013_14_uefa_champions_league_during_6_16_at_1867(Res) :- setof((Start,End),ev_21st_century_until_ev_2013_14_uefa_champions_league_during_6_16(Start,End),AllINtervals), checkvalidity(1867,AllINtervals,Res).

check_query() :- write('Query = ev_21st_century_until_ev_2013_14_uefa_champions_league_during_6_16_at_1867'), (ev_21st_century_until_ev_2013_14_uefa_champions_league_during_6_16_at_1867(true) -> write('\nRes   = true');write('\nRes   = false')).

