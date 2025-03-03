:- include('database.pl').
phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

ev_2011_12_fu_ball_bundesliga(Start,End) :- begin('ev_2011_12_fu_ball_bundesliga',_,_,Start), end('ev_2011_12_fu_ball_bundesliga',_,_,End), Start=<End.

generate_facts_phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga([]) :- assert(phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga(-1,-1)).

generate_facts_phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga([(Start,End) | Tail]) :- assert(phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga(Start,End)), generate_facts_phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga(Tail).

phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga_aux() :- findall((Start,End),phineas_and_ferb(Start,End),Interval1), findall((Start,End),ev_2011_12_fu_ball_bundesliga(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga(Interval).

phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga_at_2011(Res) :- setof((Start,End),phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga_at_2011'), (phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).
?- phineas_and_ferb_AND_ev_2011_12_fu_ball_bundesliga_aux().

