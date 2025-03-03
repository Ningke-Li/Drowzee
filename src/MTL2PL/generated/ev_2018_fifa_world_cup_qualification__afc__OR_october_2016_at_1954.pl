:- include('database.pl').
ev_2018_fifa_world_cup_qualification__afc_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__afc_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__afc_',_,_,End), Start=<End.

october_2016(Start,End) :- begin('october_2016',_,_,Start), end('october_2016',_,_,End), Start=<End.

generate_facts_ev_2018_fifa_world_cup_qualification__afc__OR_october_2016([]) :- assert(ev_2018_fifa_world_cup_qualification__afc__OR_october_2016(-1,-1)).

generate_facts_ev_2018_fifa_world_cup_qualification__afc__OR_october_2016([(Start,End) | Tail]) :- assert(ev_2018_fifa_world_cup_qualification__afc__OR_october_2016(Start,End)), generate_facts_ev_2018_fifa_world_cup_qualification__afc__OR_october_2016(Tail).

ev_2018_fifa_world_cup_qualification__afc__OR_october_2016_aux() :- findall((Start,End),ev_2018_fifa_world_cup_qualification__afc_(Start,End),Interval1), findall((Start,End),october_2016(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2018_fifa_world_cup_qualification__afc__OR_october_2016(Interval).

ev_2018_fifa_world_cup_qualification__afc__OR_october_2016_at_1954(Res) :- setof((Start,End),ev_2018_fifa_world_cup_qualification__afc__OR_october_2016(Start,End),AllINtervals), checkvalidity(1954,AllINtervals,Res).

check_query() :- write('Query = ev_2018_fifa_world_cup_qualification__afc__OR_october_2016_at_1954'), (ev_2018_fifa_world_cup_qualification__afc__OR_october_2016_at_1954(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2018_fifa_world_cup_qualification__afc__OR_october_2016_aux().

