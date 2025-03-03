:- include('database.pl').
ev_2012_13_fu_ball_bundesliga(Start,End) :- begin('ev_2012_13_fu_ball_bundesliga',_,_,Start), end('ev_2012_13_fu_ball_bundesliga',_,_,End), Start=<End.

ev_2008_summer_olympics(Start,End) :- begin('ev_2008_summer_olympics',_,_,Start), end('ev_2008_summer_olympics',_,_,End), Start=<End.

generate_facts_ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics([]) :- assert(ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics(-1,-1)).

generate_facts_ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics([(Start,End) | Tail]) :- assert(ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics(Start,End)), generate_facts_ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics(Tail).

ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics_aux() :- findall((Start,End),ev_2012_13_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),ev_2008_summer_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics(Interval).

ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics_at_2010(Res) :- setof((Start,End),ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics_at_2010'), (ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_13_fu_ball_bundesliga_OR_ev_2008_summer_olympics_aux().

