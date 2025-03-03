:- include('database.pl').
downton_abbey(Start,End) :- begin('downton_abbey',_,_,Start), end('downton_abbey',_,_,End), Start=<End.

ev_2013_14_uefa_europa_league(Start,End) :- begin('ev_2013_14_uefa_europa_league',_,_,Start), end('ev_2013_14_uefa_europa_league',_,_,End), Start=<End.

downton_abbey_last_till_1_7(Start,End) :- downton_abbey(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

downton_abbey_until_ev_2013_14_uefa_europa_league_during_1_7_overlap(Start,End) :- downton_abbey_last_till_1_7(Start1,End1), ev_2013_14_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

downton_abbey_until_ev_2013_14_uefa_europa_league_during_1_7(Start,End) :- downton_abbey(W1,_), downton_abbey_until_ev_2013_14_uefa_europa_league_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

downton_abbey_until_ev_2013_14_uefa_europa_league_during_1_7_at_1994(Res) :- setof((Start,End),downton_abbey_until_ev_2013_14_uefa_europa_league_during_1_7(Start,End),AllINtervals), checkvalidity(1994,AllINtervals,Res).

check_query() :- write('Query = downton_abbey_until_ev_2013_14_uefa_europa_league_during_1_7_at_1994'), (downton_abbey_until_ev_2013_14_uefa_europa_league_during_1_7_at_1994(true) -> write('\nRes   = true');write('\nRes   = false')).

