:- include('database.pl').
second_libyan_civil_war(Start,End) :- begin('second_libyan_civil_war',_,_,Start), end('second_libyan_civil_war',_,_,End), Start=<End.

ev_2014_fifa_club_world_cup(Start,End) :- begin('ev_2014_fifa_club_world_cup',_,_,Start), end('ev_2014_fifa_club_world_cup',_,_,End), Start=<End.

generate_facts_second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup([]) :- assert(second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup(-1,-1)).

generate_facts_second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup([(Start,End) | Tail]) :- assert(second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup(Start,End)), generate_facts_second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup(Tail).

second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup_aux() :- findall((Start,End),second_libyan_civil_war(Start,End),Interval1), findall((Start,End),ev_2014_fifa_club_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup(Interval).

second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup_at_2014(Res) :- setof((Start,End),second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup_at_2014'), (second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- second_libyan_civil_war_OR_ev_2014_fifa_club_world_cup_aux().

