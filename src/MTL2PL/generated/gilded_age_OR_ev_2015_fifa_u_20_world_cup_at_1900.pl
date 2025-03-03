:- include('database.pl').
gilded_age(Start,End) :- begin('gilded_age',_,_,Start), end('gilded_age',_,_,End), Start=<End.

ev_2015_fifa_u_20_world_cup(Start,End) :- begin('ev_2015_fifa_u_20_world_cup',_,_,Start), end('ev_2015_fifa_u_20_world_cup',_,_,End), Start=<End.

generate_facts_gilded_age_OR_ev_2015_fifa_u_20_world_cup([]) :- assert(gilded_age_OR_ev_2015_fifa_u_20_world_cup(-1,-1)).

generate_facts_gilded_age_OR_ev_2015_fifa_u_20_world_cup([(Start,End) | Tail]) :- assert(gilded_age_OR_ev_2015_fifa_u_20_world_cup(Start,End)), generate_facts_gilded_age_OR_ev_2015_fifa_u_20_world_cup(Tail).

gilded_age_OR_ev_2015_fifa_u_20_world_cup_aux() :- findall((Start,End),gilded_age(Start,End),Interval1), findall((Start,End),ev_2015_fifa_u_20_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_gilded_age_OR_ev_2015_fifa_u_20_world_cup(Interval).

gilded_age_OR_ev_2015_fifa_u_20_world_cup_at_1900(Res) :- setof((Start,End),gilded_age_OR_ev_2015_fifa_u_20_world_cup(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = gilded_age_OR_ev_2015_fifa_u_20_world_cup_at_1900'), (gilded_age_OR_ev_2015_fifa_u_20_world_cup_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).
?- gilded_age_OR_ev_2015_fifa_u_20_world_cup_aux().

