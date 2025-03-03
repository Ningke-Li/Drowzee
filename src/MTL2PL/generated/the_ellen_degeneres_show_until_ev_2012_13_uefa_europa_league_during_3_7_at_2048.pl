:- include('database.pl').
the_ellen_degeneres_show(Start,End) :- begin('the_ellen_degeneres_show',_,_,Start), end('the_ellen_degeneres_show',_,_,End), Start=<End.

ev_2012_13_uefa_europa_league(Start,End) :- begin('ev_2012_13_uefa_europa_league',_,_,Start), end('ev_2012_13_uefa_europa_league',_,_,End), Start=<End.

the_ellen_degeneres_show_last_till_3_7(Start,End) :- the_ellen_degeneres_show(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_ellen_degeneres_show_until_ev_2012_13_uefa_europa_league_during_3_7_overlap(Start,End) :- the_ellen_degeneres_show_last_till_3_7(Start1,End1), ev_2012_13_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_ellen_degeneres_show_until_ev_2012_13_uefa_europa_league_during_3_7(Start,End) :- the_ellen_degeneres_show(W1,_), the_ellen_degeneres_show_until_ev_2012_13_uefa_europa_league_during_3_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-3), Start=<End.

the_ellen_degeneres_show_until_ev_2012_13_uefa_europa_league_during_3_7_at_2048(Res) :- setof((Start,End),the_ellen_degeneres_show_until_ev_2012_13_uefa_europa_league_during_3_7(Start,End),AllINtervals), checkvalidity(2048,AllINtervals,Res).

check_query() :- write('Query = the_ellen_degeneres_show_until_ev_2012_13_uefa_europa_league_during_3_7_at_2048'), (the_ellen_degeneres_show_until_ev_2012_13_uefa_europa_league_during_3_7_at_2048(true) -> write('\nRes   = true');write('\nRes   = false')).

