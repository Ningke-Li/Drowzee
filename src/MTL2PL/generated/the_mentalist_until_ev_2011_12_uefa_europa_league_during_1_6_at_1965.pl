:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

ev_2011_12_uefa_europa_league(Start,End) :- begin('ev_2011_12_uefa_europa_league',_,_,Start), end('ev_2011_12_uefa_europa_league',_,_,End), Start=<End.

the_mentalist_last_till_1_6(Start,End) :- the_mentalist(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_mentalist_until_ev_2011_12_uefa_europa_league_during_1_6_overlap(Start,End) :- the_mentalist_last_till_1_6(Start1,End1), ev_2011_12_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_mentalist_until_ev_2011_12_uefa_europa_league_during_1_6(Start,End) :- the_mentalist(W1,_), the_mentalist_until_ev_2011_12_uefa_europa_league_during_1_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-1), Start=<End.

the_mentalist_until_ev_2011_12_uefa_europa_league_during_1_6_at_1965(Res) :- setof((Start,End),the_mentalist_until_ev_2011_12_uefa_europa_league_during_1_6(Start,End),AllINtervals), checkvalidity(1965,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_until_ev_2011_12_uefa_europa_league_during_1_6_at_1965'), (the_mentalist_until_ev_2011_12_uefa_europa_league_during_1_6_at_1965(true) -> write('\nRes   = true');write('\nRes   = false')).

