:- include('database.pl').
ev_2013_14_fu_ball_bundesliga(Start,End) :- begin('ev_2013_14_fu_ball_bundesliga',_,_,Start), end('ev_2013_14_fu_ball_bundesliga',_,_,End), Start=<End.

war_in_afghanistan(Start,End) :- begin('war_in_afghanistan',_,_,Start), end('war_in_afghanistan',_,_,End), Start=<End.

generate_facts_ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan([]) :- assert(ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan(-1,-1)).

generate_facts_ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan([(Start,End) | Tail]) :- assert(ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan(Start,End)), generate_facts_ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan(Tail).

ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan_aux() :- findall((Start,End),ev_2013_14_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),war_in_afghanistan(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan(Interval).

ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan_at_2048(Res) :- setof((Start,End),ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan(Start,End),AllINtervals), checkvalidity(2048,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan_at_2048'), (ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan_at_2048(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_fu_ball_bundesliga_AND_war_in_afghanistan_aux().

