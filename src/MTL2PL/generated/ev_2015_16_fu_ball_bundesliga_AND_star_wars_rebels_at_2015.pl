:- include('database.pl').
ev_2015_16_fu_ball_bundesliga(Start,End) :- begin('ev_2015_16_fu_ball_bundesliga',_,_,Start), end('ev_2015_16_fu_ball_bundesliga',_,_,End), Start=<End.

star_wars_rebels(Start,End) :- begin('star_wars_rebels',_,_,Start), end('star_wars_rebels',_,_,End), Start=<End.

generate_facts_ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels([]) :- assert(ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels(-1,-1)).

generate_facts_ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels([(Start,End) | Tail]) :- assert(ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels(Start,End)), generate_facts_ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels(Tail).

ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels_aux() :- findall((Start,End),ev_2015_16_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),star_wars_rebels(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels(Interval).

ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels_at_2015(Res) :- setof((Start,End),ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels_at_2015'), (ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_16_fu_ball_bundesliga_AND_star_wars_rebels_aux().

