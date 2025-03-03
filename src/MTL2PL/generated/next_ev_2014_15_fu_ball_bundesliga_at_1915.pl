:- include('database.pl').
ev_2014_15_fu_ball_bundesliga(Start,End) :- begin('ev_2014_15_fu_ball_bundesliga',_,_,Start), end('ev_2014_15_fu_ball_bundesliga',_,_,End), Start=<End.

next_ev_2014_15_fu_ball_bundesliga(Start,End) :- ev_2014_15_fu_ball_bundesliga(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2014_15_fu_ball_bundesliga_at_1915(Res) :- setof((Start,End),next_ev_2014_15_fu_ball_bundesliga(Start,End),AllINtervals), checkvalidity(1915,AllINtervals,Res).

check_query() :- write('Query = next_ev_2014_15_fu_ball_bundesliga_at_1915'), (next_ev_2014_15_fu_ball_bundesliga_at_1915(true) -> write('\nRes   = true');write('\nRes   = false')).

