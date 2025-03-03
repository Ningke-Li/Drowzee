:- include('database.pl').
dragon_ball_super(Start,End) :- begin('dragon_ball_super',_,_,Start), end('dragon_ball_super',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

generate_facts_dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification([]) :- assert(dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification(-1,-1)).

generate_facts_dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification(Start,End)), generate_facts_dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification(Tail).

dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification_aux() :- findall((Start,End),dragon_ball_super(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification(Interval).

dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification_at_1895(Res) :- setof((Start,End),dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(1895,AllINtervals,Res).

check_query() :- write('Query = dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification_at_1895'), (dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification_at_1895(true) -> write('\nRes   = true');write('\nRes   = false')).
?- dragon_ball_super_AND_ev_2018_fifa_world_cup_qualification_aux().

