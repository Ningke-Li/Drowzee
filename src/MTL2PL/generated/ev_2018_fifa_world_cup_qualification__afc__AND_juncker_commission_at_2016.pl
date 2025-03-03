:- include('database.pl').
ev_2018_fifa_world_cup_qualification__afc_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__afc_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__afc_',_,_,End), Start=<End.

juncker_commission(Start,End) :- begin('juncker_commission',_,_,Start), end('juncker_commission',_,_,End), Start=<End.

generate_facts_ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission([]) :- assert(ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission(-1,-1)).

generate_facts_ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission([(Start,End) | Tail]) :- assert(ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission(Start,End)), generate_facts_ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission(Tail).

ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission_aux() :- findall((Start,End),ev_2018_fifa_world_cup_qualification__afc_(Start,End),Interval1), findall((Start,End),juncker_commission(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission(Interval).

ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission_at_2016(Res) :- setof((Start,End),ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission(Start,End),AllINtervals), checkvalidity(2016,AllINtervals,Res).

check_query() :- write('Query = ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission_at_2016'), (ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission_at_2016(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2018_fifa_world_cup_qualification__afc__AND_juncker_commission_aux().

