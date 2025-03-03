:- include('database.pl').
ev_2013_14_premier_league(Start,End) :- begin('ev_2013_14_premier_league',_,_,Start), end('ev_2013_14_premier_league',_,_,End), Start=<End.

finally_ev_2013_14_premier_league_during_4_19(Start,End) :- ev_2013_14_premier_league(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_ev_2013_14_premier_league_during_4_19_at_2000(Res) :- setof((Start,End),finally_ev_2013_14_premier_league_during_4_19(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2013_14_premier_league_during_4_19_at_2000'), (finally_ev_2013_14_premier_league_during_4_19_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

