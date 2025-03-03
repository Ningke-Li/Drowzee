:- include('database.pl').
fringe(Start,End) :- begin('fringe',_,_,Start), end('fringe',_,_,End), Start=<End.

ev_2011_12_uefa_europa_league(Start,End) :- begin('ev_2011_12_uefa_europa_league',_,_,Start), end('ev_2011_12_uefa_europa_league',_,_,End), Start=<End.

fringe_last_till_2_3(Start,End) :- fringe(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

fringe_until_ev_2011_12_uefa_europa_league_during_2_3_overlap(Start,End) :- fringe_last_till_2_3(Start1,End1), ev_2011_12_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

fringe_until_ev_2011_12_uefa_europa_league_during_2_3(Start,End) :- fringe(W1,_), fringe_until_ev_2011_12_uefa_europa_league_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

fringe_until_ev_2011_12_uefa_europa_league_during_2_3_at_2011(Res) :- setof((Start,End),fringe_until_ev_2011_12_uefa_europa_league_during_2_3(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = fringe_until_ev_2011_12_uefa_europa_league_during_2_3_at_2011'), (fringe_until_ev_2011_12_uefa_europa_league_during_2_3_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

