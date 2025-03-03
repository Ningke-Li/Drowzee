:- include('database.pl').
criminal_minds(Start,End) :- begin('criminal_minds',_,_,Start), end('criminal_minds',_,_,End), Start=<End.

ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

criminal_minds_last_till_1_4(Start,End) :- criminal_minds(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

criminal_minds_until_ev_2012_13_uefa_europa_league_during_1_4_overlap(Start,End) :- criminal_minds_last_till_1_4(Start1,End1), ev_2012_13_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

criminal_minds_until_ev_2012_13_uefa_europa_league_during_1_4(Start,End) :- criminal_minds(W1,_), criminal_minds_until_ev_2012_13_uefa_europa_league_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

criminal_minds_until_ev_2012_13_uefa_europa_league_during_1_4_at_2058(Res) :- setof((Start,End),criminal_minds_until_ev_2012_13_uefa_europa_league_during_1_4(Start,End),AllINtervals), checkvalidity(2058,AllINtervals,Res).

check_query() :- write('Query = criminal_minds_until_ev_2012_13_uefa_europa_league_during_1_4_at_2058'), (criminal_minds_until_ev_2012_13_uefa_europa_league_during_1_4_at_2058(true) -> write('\nRes   = true');write('\nRes   = false')).

