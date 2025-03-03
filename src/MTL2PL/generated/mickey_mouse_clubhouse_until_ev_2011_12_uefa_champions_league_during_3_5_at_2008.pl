:- include('database.pl').
mickey_mouse_clubhouse(Start,End) :- begin('mickey_mouse_clubhouse',_,_,Start), end('mickey_mouse_clubhouse',_,_,End), Start=<End.

ev_2011_12_uefa_champions_league(Start,End) :- begin('ev_2011_12_uefa_champions_league',_,_,Start), end('ev_2011_12_uefa_champions_league',_,_,End), Start=<End.

mickey_mouse_clubhouse_last_till_3_5(Start,End) :- mickey_mouse_clubhouse(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

mickey_mouse_clubhouse_until_ev_2011_12_uefa_champions_league_during_3_5_overlap(Start,End) :- mickey_mouse_clubhouse_last_till_3_5(Start1,End1), ev_2011_12_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mickey_mouse_clubhouse_until_ev_2011_12_uefa_champions_league_during_3_5(Start,End) :- mickey_mouse_clubhouse(W1,_), mickey_mouse_clubhouse_until_ev_2011_12_uefa_champions_league_during_3_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-3), Start=<End.

mickey_mouse_clubhouse_until_ev_2011_12_uefa_champions_league_during_3_5_at_2008(Res) :- setof((Start,End),mickey_mouse_clubhouse_until_ev_2011_12_uefa_champions_league_during_3_5(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = mickey_mouse_clubhouse_until_ev_2011_12_uefa_champions_league_during_3_5_at_2008'), (mickey_mouse_clubhouse_until_ev_2011_12_uefa_champions_league_during_3_5_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

