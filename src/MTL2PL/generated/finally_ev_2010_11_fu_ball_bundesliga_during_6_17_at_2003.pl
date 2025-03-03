:- include('database.pl').
ev_2010_11_fu_ball_bundesliga(Start,End) :- begin('ev_2010_11_fu_ball_bundesliga',_,_,Start), end('ev_2010_11_fu_ball_bundesliga',_,_,End), Start=<End.

finally_ev_2010_11_fu_ball_bundesliga_during_6_17(Start,End) :- ev_2010_11_fu_ball_bundesliga(Start1,End1), (Start1-17)=<(End1-6), Start is (Start1-17), End is (End1-6), Start=<End.

finally_ev_2010_11_fu_ball_bundesliga_during_6_17_at_2003(Res) :- setof((Start,End),finally_ev_2010_11_fu_ball_bundesliga_during_6_17(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_11_fu_ball_bundesliga_during_6_17_at_2003'), (finally_ev_2010_11_fu_ball_bundesliga_during_6_17_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

