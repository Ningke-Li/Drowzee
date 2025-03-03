:- include('database.pl').
ev_2008_09_fu_ball_bundesliga(Start,End) :- begin('ev_2008_09_fu_ball_bundesliga',_,_,Start), end('ev_2008_09_fu_ball_bundesliga',_,_,End), Start=<End.

one_tree_hill(Start,End) :- begin('one_tree_hill',_,_,Start), end('one_tree_hill',_,_,End), Start=<End.

generate_facts_ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill([]) :- assert(ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill(-1,-1)).

generate_facts_ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill([(Start,End) | Tail]) :- assert(ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill(Start,End)), generate_facts_ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill(Tail).

ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill_aux() :- findall((Start,End),ev_2008_09_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),one_tree_hill(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill(Interval).

ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill_at_1890(Res) :- setof((Start,End),ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill(Start,End),AllINtervals), checkvalidity(1890,AllINtervals,Res).

check_query() :- write('Query = ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill_at_1890'), (ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill_at_1890(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_09_fu_ball_bundesliga_AND_one_tree_hill_aux().

