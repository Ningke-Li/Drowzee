:- include('database.pl').
ev_2014_fifa_world_cup_qualification(Start,End) :- begin('ev_2014_fifa_world_cup_qualification',_,_,Start), end('ev_2014_fifa_world_cup_qualification',_,_,End), Start=<End.

nuremberg_medical_trial(Start,End) :- begin('nuremberg_medical_trial',_,_,Start), end('nuremberg_medical_trial',_,_,End), Start=<End.

generate_facts_ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial([]) :- assert(ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial(-1,-1)).

generate_facts_ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial([(Start,End) | Tail]) :- assert(ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial(Start,End)), generate_facts_ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial(Tail).

ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial_aux() :- findall((Start,End),ev_2014_fifa_world_cup_qualification(Start,End),Interval1), findall((Start,End),nuremberg_medical_trial(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial(Interval).

ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial_at_1946(Res) :- setof((Start,End),ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial(Start,End),AllINtervals), checkvalidity(1946,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial_at_1946'), (ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial_at_1946(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fifa_world_cup_qualification_OR_nuremberg_medical_trial_aux().

