:- include('database.pl').
ev_2010_fifa_club_world_cup(Start,End) :- begin('ev_2010_fifa_club_world_cup',_,_,Start), end('ev_2010_fifa_club_world_cup',_,_,End), Start=<End.

tibet(Start,End) :- begin('tibet',_,_,Start), end('tibet',_,_,End), Start=<End.

generate_facts_ev_2010_fifa_club_world_cup_OR_tibet([]) :- assert(ev_2010_fifa_club_world_cup_OR_tibet(-1,-1)).

generate_facts_ev_2010_fifa_club_world_cup_OR_tibet([(Start,End) | Tail]) :- assert(ev_2010_fifa_club_world_cup_OR_tibet(Start,End)), generate_facts_ev_2010_fifa_club_world_cup_OR_tibet(Tail).

ev_2010_fifa_club_world_cup_OR_tibet_aux() :- findall((Start,End),ev_2010_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),tibet(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2010_fifa_club_world_cup_OR_tibet(Interval).

ev_2010_fifa_club_world_cup_OR_tibet_at_1874(Res) :- setof((Start,End),ev_2010_fifa_club_world_cup_OR_tibet(Start,End),AllINtervals), checkvalidity(1874,AllINtervals,Res).

check_query() :- write('Query = ev_2010_fifa_club_world_cup_OR_tibet_at_1874'), (ev_2010_fifa_club_world_cup_OR_tibet_at_1874(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2010_fifa_club_world_cup_OR_tibet_aux().

