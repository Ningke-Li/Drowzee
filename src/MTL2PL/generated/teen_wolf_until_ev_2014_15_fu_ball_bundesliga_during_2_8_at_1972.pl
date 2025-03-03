:- include('database.pl').
teen_wolf(Start,End) :- begin('teen_wolf',_,_,Start), end('teen_wolf',_,_,End), Start=<End.

ev_2014_15_fu_ball_bundesliga(Start,End) :- begin('ev_2014_15_fu_ball_bundesliga',_,_,Start), end('ev_2014_15_fu_ball_bundesliga',_,_,End), Start=<End.

teen_wolf_last_till_2_8(Start,End) :- teen_wolf(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

teen_wolf_until_ev_2014_15_fu_ball_bundesliga_during_2_8_overlap(Start,End) :- teen_wolf_last_till_2_8(Start1,End1), ev_2014_15_fu_ball_bundesliga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

teen_wolf_until_ev_2014_15_fu_ball_bundesliga_during_2_8(Start,End) :- teen_wolf(W1,_), teen_wolf_until_ev_2014_15_fu_ball_bundesliga_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

teen_wolf_until_ev_2014_15_fu_ball_bundesliga_during_2_8_at_1972(Res) :- setof((Start,End),teen_wolf_until_ev_2014_15_fu_ball_bundesliga_during_2_8(Start,End),AllINtervals), checkvalidity(1972,AllINtervals,Res).

check_query() :- write('Query = teen_wolf_until_ev_2014_15_fu_ball_bundesliga_during_2_8_at_1972'), (teen_wolf_until_ev_2014_15_fu_ball_bundesliga_during_2_8_at_1972(true) -> write('\nRes   = true');write('\nRes   = false')).

