:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

ev_2008_09_uefa_champions_league(Start,End) :- begin('ev_2008_09_uefa_champions_league',_,_,Start), end('ev_2008_09_uefa_champions_league',_,_,End), Start=<End.

the_x_factor_last_till_3_5(Start,End) :- the_x_factor(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_x_factor_until_ev_2008_09_uefa_champions_league_during_3_5_overlap(Start,End) :- the_x_factor_last_till_3_5(Start1,End1), ev_2008_09_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_x_factor_until_ev_2008_09_uefa_champions_league_during_3_5(Start,End) :- the_x_factor(W1,_), the_x_factor_until_ev_2008_09_uefa_champions_league_during_3_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-3), Start=<End.

the_x_factor_until_ev_2008_09_uefa_champions_league_during_3_5_at_1897(Res) :- setof((Start,End),the_x_factor_until_ev_2008_09_uefa_champions_league_during_3_5(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_until_ev_2008_09_uefa_champions_league_during_3_5_at_1897'), (the_x_factor_until_ev_2008_09_uefa_champions_league_during_3_5_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).

