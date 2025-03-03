:- include('database.pl').
the_lion_guard(Start,End) :- begin('the_lion_guard',_,_,Start), end('the_lion_guard',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification__afc_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__afc_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__afc_',_,_,End), Start=<End.

generate_facts_the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc_([]) :- assert(the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc_(-1,-1)).

generate_facts_the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc_([(Start,End) | Tail]) :- assert(the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc_(Start,End)), generate_facts_the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc_(Tail).

the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc__aux() :- findall((Start,End),the_lion_guard(Start,End),Interval1), findall((Start,End),ev_2018_fifa_world_cup_qualification__afc_(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc_(Interval).

the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc__at_2017(Res) :- setof((Start,End),the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc_(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc__at_2017'), (the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc__at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_lion_guard_AND_ev_2018_fifa_world_cup_qualification__afc__aux().

