:- include('database.pl').
iraq_war(Start,End) :- begin('iraq_war',_,_,Start), end('iraq_war',_,_,End), Start=<End.

ev_2010_11_fu_ball_bundesliga(Start,End) :- begin('ev_2010_11_fu_ball_bundesliga',_,_,Start), end('ev_2010_11_fu_ball_bundesliga',_,_,End), Start=<End.

generate_facts_iraq_war_AND_ev_2010_11_fu_ball_bundesliga([]) :- assert(iraq_war_AND_ev_2010_11_fu_ball_bundesliga(-1,-1)).

generate_facts_iraq_war_AND_ev_2010_11_fu_ball_bundesliga([(Start,End) | Tail]) :- assert(iraq_war_AND_ev_2010_11_fu_ball_bundesliga(Start,End)), generate_facts_iraq_war_AND_ev_2010_11_fu_ball_bundesliga(Tail).

iraq_war_AND_ev_2010_11_fu_ball_bundesliga_aux() :- findall((Start,End),iraq_war(Start,End),Interval1), findall((Start,End),ev_2010_11_fu_ball_bundesliga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_iraq_war_AND_ev_2010_11_fu_ball_bundesliga(Interval).

iraq_war_AND_ev_2010_11_fu_ball_bundesliga_at_1999(Res) :- setof((Start,End),iraq_war_AND_ev_2010_11_fu_ball_bundesliga(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = iraq_war_AND_ev_2010_11_fu_ball_bundesliga_at_1999'), (iraq_war_AND_ev_2010_11_fu_ball_bundesliga_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).
?- iraq_war_AND_ev_2010_11_fu_ball_bundesliga_aux().

