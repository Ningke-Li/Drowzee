:- include('database.pl').
ev_2010_commonwealth_games(Start,End) :- begin('ev_2010_commonwealth_games',_,_,Start), end('ev_2010_commonwealth_games',_,_,End), Start=<End.

finally_ev_2010_commonwealth_games_during_10_12(Start,End) :- ev_2010_commonwealth_games(Start1,End1), (Start1-12)=<(End1-10), Start is (Start1-12), End is (End1-10), Start=<End.

finally_ev_2010_commonwealth_games_during_10_12_at_2000(Res) :- setof((Start,End),finally_ev_2010_commonwealth_games_during_10_12(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_commonwealth_games_during_10_12_at_2000'), (finally_ev_2010_commonwealth_games_during_10_12_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

