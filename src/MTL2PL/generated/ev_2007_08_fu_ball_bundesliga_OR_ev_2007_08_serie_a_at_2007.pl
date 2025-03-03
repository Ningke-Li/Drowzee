:- include('database.pl').
ev_2007_08_fu_ball_bundesliga(Start,End) :- begin('ev_2007_08_fu_ball_bundesliga',_,_,Start), end('ev_2007_08_fu_ball_bundesliga',_,_,End), Start=<End.

ev_2007_08_serie_a(Start,End) :- begin('ev_2007_08_serie_a',_,_,Start), end('ev_2007_08_serie_a',_,_,End), Start=<End.

generate_facts_ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a([]) :- assert(ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a(-1,-1)).

generate_facts_ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a([(Start,End) | Tail]) :- assert(ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a(Start,End)), generate_facts_ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a(Tail).

ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a_aux() :- findall((Start,End),ev_2007_08_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),ev_2007_08_serie_a(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a(Interval).

ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a_at_2007(Res) :- setof((Start,End),ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a_at_2007'), (ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_fu_ball_bundesliga_OR_ev_2007_08_serie_a_aux().

