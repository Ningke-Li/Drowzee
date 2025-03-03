:- include('database.pl').
victorious(Start,End) :- begin('victorious',_,_,Start), end('victorious',_,_,End), Start=<End.

ev_2011_12_fu_ball_bundesliga(Start,End) :- begin('ev_2011_12_fu_ball_bundesliga',_,_,Start), end('ev_2011_12_fu_ball_bundesliga',_,_,End), Start=<End.

generate_facts_victorious_AND_ev_2011_12_fu_ball_bundesliga([]) :- assert(victorious_AND_ev_2011_12_fu_ball_bundesliga(-1,-1)).

generate_facts_victorious_AND_ev_2011_12_fu_ball_bundesliga([(Start,End) | Tail]) :- assert(victorious_AND_ev_2011_12_fu_ball_bundesliga(Start,End)), generate_facts_victorious_AND_ev_2011_12_fu_ball_bundesliga(Tail).

victorious_AND_ev_2011_12_fu_ball_bundesliga_aux() :- findall((Start,End),victorious(Start,End),Interval1), findall((Start,End),ev_2011_12_fu_ball_bundesliga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_victorious_AND_ev_2011_12_fu_ball_bundesliga(Interval).

victorious_AND_ev_2011_12_fu_ball_bundesliga_at_1988(Res) :- setof((Start,End),victorious_AND_ev_2011_12_fu_ball_bundesliga(Start,End),AllINtervals), checkvalidity(1988,AllINtervals,Res).

check_query() :- write('Query = victorious_AND_ev_2011_12_fu_ball_bundesliga_at_1988'), (victorious_AND_ev_2011_12_fu_ball_bundesliga_at_1988(true) -> write('\nRes   = true');write('\nRes   = false')).
?- victorious_AND_ev_2011_12_fu_ball_bundesliga_aux().

