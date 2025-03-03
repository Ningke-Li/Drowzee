:- include('database.pl').
war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

ev_2013_14_fu_ball_bundesliga(Start,End) :- begin('ev_2013_14_fu_ball_bundesliga',_,_,Start), end('ev_2013_14_fu_ball_bundesliga',_,_,End), Start=<End.

war_in_afghanistan_last_till_10_11(Start,End) :- war_in_afghanistan(Start1,End1), (End1-Start1)>=10, Start is (Start1+10), End is (End1+1).

war_in_afghanistan_until_ev_2013_14_fu_ball_bundesliga_during_10_11_overlap(Start,End) :- war_in_afghanistan_last_till_10_11(Start1,End1), ev_2013_14_fu_ball_bundesliga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

war_in_afghanistan_until_ev_2013_14_fu_ball_bundesliga_during_10_11(Start,End) :- war_in_afghanistan(W1,_), war_in_afghanistan_until_ev_2013_14_fu_ball_bundesliga_during_10_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-10), Start=<End.

war_in_afghanistan_until_ev_2013_14_fu_ball_bundesliga_during_10_11_at_1963(Res) :- setof((Start,End),war_in_afghanistan_until_ev_2013_14_fu_ball_bundesliga_during_10_11(Start,End),AllINtervals), checkvalidity(1963,AllINtervals,Res).

check_query() :- write('Query = war_in_afghanistan_until_ev_2013_14_fu_ball_bundesliga_during_10_11_at_1963'), (war_in_afghanistan_until_ev_2013_14_fu_ball_bundesliga_during_10_11_at_1963(true) -> write('\nRes   = true');write('\nRes   = false')).

