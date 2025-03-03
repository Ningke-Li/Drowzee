:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

ev_2011_12_uefa_champions_league(Start,End) :- begin('ev_2011_12_uefa_champions_league',_,_,Start), end('ev_2011_12_uefa_champions_league',_,_,End), Start=<End.

the_mentalist_last_till_2_3(Start,End) :- the_mentalist(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_mentalist_until_ev_2011_12_uefa_champions_league_during_2_3_overlap(Start,End) :- the_mentalist_last_till_2_3(Start1,End1), ev_2011_12_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_mentalist_until_ev_2011_12_uefa_champions_league_during_2_3(Start,End) :- the_mentalist(W1,_), the_mentalist_until_ev_2011_12_uefa_champions_league_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

the_mentalist_until_ev_2011_12_uefa_champions_league_during_2_3_at_1876(Res) :- setof((Start,End),the_mentalist_until_ev_2011_12_uefa_champions_league_during_2_3(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_until_ev_2011_12_uefa_champions_league_during_2_3_at_1876'), (the_mentalist_until_ev_2011_12_uefa_champions_league_during_2_3_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

