:- include('database.pl').
sustainable_development_goals(Start,End) :- begin('sustainable_development_goals',_,_,Start), end('sustainable_development_goals',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

generate_facts_sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification([]) :- assert(sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification(-1,-1)).

generate_facts_sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification([(Start,End) | Tail]) :- assert(sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification(Start,End)), generate_facts_sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification(Tail).

sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification_aux() :- findall((Start,End),sustainable_development_goals(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification(Interval).

sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification_at_2014(Res) :- setof((Start,End),sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification_at_2014'), (sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sustainable_development_goals_AND_ev_2018_fifa_world_cup_qualification_aux().

