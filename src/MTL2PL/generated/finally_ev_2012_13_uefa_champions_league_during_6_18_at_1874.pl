:- include('database.pl').
ev_2012_13_uefa_champions_league(Start,End) :- begin('ev_2012_13_uefa_champions_league',_,_,Start), end('ev_2012_13_uefa_champions_league',_,_,End), Start=<End.

finally_ev_2012_13_uefa_champions_league_during_6_18(Start,End) :- ev_2012_13_uefa_champions_league(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

finally_ev_2012_13_uefa_champions_league_during_6_18_at_1874(Res) :- setof((Start,End),finally_ev_2012_13_uefa_champions_league_during_6_18(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2012_13_uefa_champions_league_during_6_18_at_1874'), (finally_ev_2012_13_uefa_champions_league_during_6_18_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).

