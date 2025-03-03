:- include('database.pl').
ev_2012_fifa_club_world_cup(Start,End) :- begin('ev_2012_fifa_club_world_cup',_,_,Start), end('ev_2012_fifa_club_world_cup',_,_,End), Start=<End.

vienna_offensive(Start,End) :- begin('vienna_offensive',_,_,Start), end('vienna_offensive',_,_,End), Start=<End.

generate_facts_ev_2012_fifa_club_world_cup_OR_vienna_offensive([]) :- assert(ev_2012_fifa_club_world_cup_OR_vienna_offensive(-1,-1)).

generate_facts_ev_2012_fifa_club_world_cup_OR_vienna_offensive([(Start,End) | Tail]) :- assert(ev_2012_fifa_club_world_cup_OR_vienna_offensive(Start,End)), generate_facts_ev_2012_fifa_club_world_cup_OR_vienna_offensive(Tail).

ev_2012_fifa_club_world_cup_OR_vienna_offensive_aux() :- findall((Start,End),ev_2012_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),vienna_offensive(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2012_fifa_club_world_cup_OR_vienna_offensive(Interval).

ev_2012_fifa_club_world_cup_OR_vienna_offensive_at_1891(Res) :- setof((Start,End),ev_2012_fifa_club_world_cup_OR_vienna_offensive(Start,End),AllINtervals), checkvalidity(1891,AllINtervals,Res).

check_query() :- write('Query = ev_2012_fifa_club_world_cup_OR_vienna_offensive_at_1891'), (ev_2012_fifa_club_world_cup_OR_vienna_offensive_at_1891(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2012_fifa_club_world_cup_OR_vienna_offensive_aux().

