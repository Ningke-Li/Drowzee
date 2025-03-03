:- include('database.pl').
ev_2008_09_fu_ball_bundesliga(Start,End) :- begin('ev_2008_09_fu_ball_bundesliga',_,_,Start), end('ev_2008_09_fu_ball_bundesliga',_,_,End), Start=<End.

the_l_word(Start,End) :- begin('the_l_word',_,_,Start), end('the_l_word',_,_,End), Start=<End.

generate_facts_ev_2008_09_fu_ball_bundesliga_AND_the_l_word([]) :- assert(ev_2008_09_fu_ball_bundesliga_AND_the_l_word(-1,-1)).

generate_facts_ev_2008_09_fu_ball_bundesliga_AND_the_l_word([(Start,End) | Tail]) :- assert(ev_2008_09_fu_ball_bundesliga_AND_the_l_word(Start,End)), generate_facts_ev_2008_09_fu_ball_bundesliga_AND_the_l_word(Tail).

ev_2008_09_fu_ball_bundesliga_AND_the_l_word_aux() :- findall((Start,End),ev_2008_09_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),the_l_word(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2008_09_fu_ball_bundesliga_AND_the_l_word(Interval).

ev_2008_09_fu_ball_bundesliga_AND_the_l_word_at_2009(Res) :- setof((Start,End),ev_2008_09_fu_ball_bundesliga_AND_the_l_word(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = ev_2008_09_fu_ball_bundesliga_AND_the_l_word_at_2009'), (ev_2008_09_fu_ball_bundesliga_AND_the_l_word_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2008_09_fu_ball_bundesliga_AND_the_l_word_aux().

