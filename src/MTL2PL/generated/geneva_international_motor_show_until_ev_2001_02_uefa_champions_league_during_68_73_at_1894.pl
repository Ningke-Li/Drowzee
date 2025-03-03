:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

ev_2001_02_uefa_champions_league(Start,End) :- begin('ev_2001_02_uefa_champions_league',_,_,Start), end('ev_2001_02_uefa_champions_league',_,_,End), Start=<End.

geneva_international_motor_show_last_till_68_73(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=68, Start is (Start1+68), End is (End1+1).

geneva_international_motor_show_until_ev_2001_02_uefa_champions_league_during_68_73_overlap(Start,End) :- geneva_international_motor_show_last_till_68_73(Start1,End1), ev_2001_02_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_ev_2001_02_uefa_champions_league_during_68_73(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_ev_2001_02_uefa_champions_league_during_68_73_overlap(Start1,End1), Start is max((Start1-73),W1), End is (End1-68), Start=<End.

geneva_international_motor_show_until_ev_2001_02_uefa_champions_league_during_68_73_at_1894(Res) :- setof((Start,End),geneva_international_motor_show_until_ev_2001_02_uefa_champions_league_during_68_73(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_ev_2001_02_uefa_champions_league_during_68_73_at_1894'), (geneva_international_motor_show_until_ev_2001_02_uefa_champions_league_during_68_73_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).

