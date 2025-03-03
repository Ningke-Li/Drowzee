:- include('database.pl').
ev_2009_10_fu_ball_bundesliga(Start,End) :- begin('ev_2009_10_fu_ball_bundesliga',_,_,Start), end('ev_2009_10_fu_ball_bundesliga',_,_,End), Start=<End.

finally_ev_2009_10_fu_ball_bundesliga_during_4_12(Start,End) :- ev_2009_10_fu_ball_bundesliga(Start1,End1), (Start1-12)=<(End1-4), Start is (Start1-12), End is (End1-4), Start=<End.

finally_ev_2009_10_fu_ball_bundesliga_during_4_12_at_2005(Res) :- setof((Start,End),finally_ev_2009_10_fu_ball_bundesliga_during_4_12(Start,End),AllINtervals), checkvalidity(2005,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_10_fu_ball_bundesliga_during_4_12_at_2005'), (finally_ev_2009_10_fu_ball_bundesliga_during_4_12_at_2005(true) -> write('\nRes   = true');write('\nRes   = false')).

