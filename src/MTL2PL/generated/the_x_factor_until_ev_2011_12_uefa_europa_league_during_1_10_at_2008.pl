:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

ev_2011_12_uefa_europa_league(Start,End) :- begin('ev_2011_12_uefa_europa_league',_,_,Start), end('ev_2011_12_uefa_europa_league',_,_,End), Start=<End.

the_x_factor_last_till_1_10(Start,End) :- the_x_factor(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_x_factor_until_ev_2011_12_uefa_europa_league_during_1_10_overlap(Start,End) :- the_x_factor_last_till_1_10(Start1,End1), ev_2011_12_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_x_factor_until_ev_2011_12_uefa_europa_league_during_1_10(Start,End) :- the_x_factor(W1,_), the_x_factor_until_ev_2011_12_uefa_europa_league_during_1_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-1), Start=<End.

the_x_factor_until_ev_2011_12_uefa_europa_league_during_1_10_at_2008(Res) :- setof((Start,End),the_x_factor_until_ev_2011_12_uefa_europa_league_during_1_10(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_until_ev_2011_12_uefa_europa_league_during_1_10_at_2008'), (the_x_factor_until_ev_2011_12_uefa_europa_league_during_1_10_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

