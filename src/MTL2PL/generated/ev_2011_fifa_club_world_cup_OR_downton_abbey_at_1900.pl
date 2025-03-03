:- include('database.pl').
ev_2011_fifa_club_world_cup(Start,End) :- begin('ev_2011_fifa_club_world_cup',_,_,Start), end('ev_2011_fifa_club_world_cup',_,_,End), Start=<End.

downton_abbey(Start,End) :- begin('downton_abbey',_,_,Start), end('downton_abbey',_,_,End), Start=<End.

generate_facts_ev_2011_fifa_club_world_cup_OR_downton_abbey([]) :- assert(ev_2011_fifa_club_world_cup_OR_downton_abbey(-1,-1)).

generate_facts_ev_2011_fifa_club_world_cup_OR_downton_abbey([(Start,End) | Tail]) :- assert(ev_2011_fifa_club_world_cup_OR_downton_abbey(Start,End)), generate_facts_ev_2011_fifa_club_world_cup_OR_downton_abbey(Tail).

ev_2011_fifa_club_world_cup_OR_downton_abbey_aux() :- findall((Start,End),ev_2011_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),downton_abbey(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2011_fifa_club_world_cup_OR_downton_abbey(Interval).

ev_2011_fifa_club_world_cup_OR_downton_abbey_at_1900(Res) :- setof((Start,End),ev_2011_fifa_club_world_cup_OR_downton_abbey(Start,End),AllINtervals), checkvalidity(1900,AllINtervals,Res).

check_query() :- write('Query = ev_2011_fifa_club_world_cup_OR_downton_abbey_at_1900'), (ev_2011_fifa_club_world_cup_OR_downton_abbey_at_1900(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2011_fifa_club_world_cup_OR_downton_abbey_aux().

