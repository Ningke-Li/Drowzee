:- include('database.pl').
prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

ev_2011_12_uefa_europa_league(Start,End) :- begin('ev_2011_12_uefa_europa_league',_,_,Start), end('ev_2011_12_uefa_europa_league',_,_,End), Start=<End.

prison_break_last_till_3_13(Start,End) :- prison_break(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

prison_break_until_ev_2011_12_uefa_europa_league_during_3_13_overlap(Start,End) :- prison_break_last_till_3_13(Start1,End1), ev_2011_12_uefa_europa_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

prison_break_until_ev_2011_12_uefa_europa_league_during_3_13(Start,End) :- prison_break(W1,_), prison_break_until_ev_2011_12_uefa_europa_league_during_3_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-3), Start=<End.

prison_break_until_ev_2011_12_uefa_europa_league_during_3_13_at_1861(Res) :- setof((Start,End),prison_break_until_ev_2011_12_uefa_europa_league_during_3_13(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = prison_break_until_ev_2011_12_uefa_europa_league_during_3_13_at_1861'), (prison_break_until_ev_2011_12_uefa_europa_league_during_3_13_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).

