:- include('database.pl').
ev_2015_16_fu_ball_bundesliga(Start,End) :- begin('ev_2015_16_fu_ball_bundesliga',_,_,Start), end('ev_2015_16_fu_ball_bundesliga',_,_,End), Start=<End.

opium_wars(Start,End) :- begin('opium_wars',_,_,Start), end('opium_wars',_,_,End), Start=<End.

generate_facts_ev_2015_16_fu_ball_bundesliga_OR_opium_wars([]) :- assert(ev_2015_16_fu_ball_bundesliga_OR_opium_wars(-1,-1)).

generate_facts_ev_2015_16_fu_ball_bundesliga_OR_opium_wars([(Start,End) | Tail]) :- assert(ev_2015_16_fu_ball_bundesliga_OR_opium_wars(Start,End)), generate_facts_ev_2015_16_fu_ball_bundesliga_OR_opium_wars(Tail).

ev_2015_16_fu_ball_bundesliga_OR_opium_wars_aux() :- findall((Start,End),ev_2015_16_fu_ball_bundesliga(Start,End),Interval1), findall((Start,End),opium_wars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2015_16_fu_ball_bundesliga_OR_opium_wars(Interval).

ev_2015_16_fu_ball_bundesliga_OR_opium_wars_at_1792(Res) :- setof((Start,End),ev_2015_16_fu_ball_bundesliga_OR_opium_wars(Start,End),AllINtervals), checkvalidity(1792,AllINtervals,Res).

check_query() :- write('Query = ev_2015_16_fu_ball_bundesliga_OR_opium_wars_at_1792'), (ev_2015_16_fu_ball_bundesliga_OR_opium_wars_at_1792(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2015_16_fu_ball_bundesliga_OR_opium_wars_aux().

