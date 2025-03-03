:- include('database.pl').
harry_potter(Start,End) :- begin('harry_potter',_,_,Start), end('harry_potter',_,_,End), Start=<End.

ev_2009_10_uefa_europa_league(Start,End) :- begin('ev_2009_10_uefa_europa_league',_,_,Start), end('ev_2009_10_uefa_europa_league',_,_,End), Start=<End.

harry_potter_last_till_4_5(Start,End) :- harry_potter(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

harry_potter_until_ev_2009_10_uefa_europa_league_during_4_5_overlap(Start,End) :- harry_potter_last_till_4_5(Start1,End1), ev_2009_10_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

harry_potter_until_ev_2009_10_uefa_europa_league_during_4_5(Start,End) :- harry_potter(W1,_), harry_potter_until_ev_2009_10_uefa_europa_league_during_4_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-4), Start=<End.

harry_potter_until_ev_2009_10_uefa_europa_league_during_4_5_at_2006(Res) :- setof((Start,End),harry_potter_until_ev_2009_10_uefa_europa_league_during_4_5(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = harry_potter_until_ev_2009_10_uefa_europa_league_during_4_5_at_2006'), (harry_potter_until_ev_2009_10_uefa_europa_league_during_4_5_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

