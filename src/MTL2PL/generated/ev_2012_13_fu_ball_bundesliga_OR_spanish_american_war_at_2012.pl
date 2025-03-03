:- include('database.pl').
ev_2012_13_fu_ball_bundesliga(Start,End) :- begin('ev_2012_13_fu_ball_bundesliga',_,_,Start), end('ev_2012_13_fu_ball_bundesliga',_,_,End), Start=<End.

spanish_american_war(Start,End) :- begin('spanish_american_war',_,_,Start), end('spanish_american_war',_,_,End), Start=<End.

generate_facts_ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war([]) :- assert(ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war(-1,-1)).

generate_facts_ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war([(Start,End) | Tail]) :- assert(ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war(Start,End)), generate_facts_ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war(Tail).

ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war_aux() :- findall((Start,End),ev_2012_13_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),spanish_american_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war(Interval).

ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war_at_2012(Res) :- setof((Start,End),ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war_at_2012'), (ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_fu_ball_bundesliga_OR_spanish_american_war_aux().

