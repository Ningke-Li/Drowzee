:- include('database.pl').
ev_2013_14_uefa_europa_league(Start,End) :- begin('ev_2013_14_uefa_europa_league',_,_,Start), end('ev_2013_14_uefa_europa_league',_,_,End), Start=<End.

finally_ev_2013_14_uefa_europa_league_during_4_20(Start,End) :- ev_2013_14_uefa_europa_league(Start1,End1), (Start1-20)=<(End1-4), Start is (Start1-20), End is (End1-4), Start=<End.

finally_ev_2013_14_uefa_europa_league_during_4_20_at_1871(Res) :- setof((Start,End),finally_ev_2013_14_uefa_europa_league_during_4_20(Start,End),AllINtervals), checkvalidity(1871,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2013_14_uefa_europa_league_during_4_20_at_1871'), (finally_ev_2013_14_uefa_europa_league_during_4_20_at_1871(true) -> write('\nRes   = true');write('\nRes   = false')).

