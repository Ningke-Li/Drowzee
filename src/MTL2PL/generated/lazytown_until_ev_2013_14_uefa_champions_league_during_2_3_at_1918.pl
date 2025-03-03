:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

ev_2013_14_uefa_champions_league(Start,End) :- begin('ev_2013_14_uefa_champions_league',_,_,Start), end('ev_2013_14_uefa_champions_league',_,_,End), Start=<End.

lazytown_last_till_2_3(Start,End) :- lazytown(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

lazytown_until_ev_2013_14_uefa_champions_league_during_2_3_overlap(Start,End) :- lazytown_last_till_2_3(Start1,End1), ev_2013_14_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lazytown_until_ev_2013_14_uefa_champions_league_during_2_3(Start,End) :- lazytown(W1,_), lazytown_until_ev_2013_14_uefa_champions_league_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

lazytown_until_ev_2013_14_uefa_champions_league_during_2_3_at_1918(Res) :- setof((Start,End),lazytown_until_ev_2013_14_uefa_champions_league_during_2_3(Start,End),AllINtervals), checkvalidity(1918,AllINtervals,Res).

check_query() :- write('Query = lazytown_until_ev_2013_14_uefa_champions_league_during_2_3_at_1918'), (lazytown_until_ev_2013_14_uefa_champions_league_during_2_3_at_1918(true) -> write('\nRes   = true');write('\nRes   = false')).

