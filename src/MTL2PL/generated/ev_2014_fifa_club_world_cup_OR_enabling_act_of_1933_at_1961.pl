:- include('database.pl').
ev_2014_fifa_club_world_cup(Start,End) :- begin('ev_2014_fifa_club_world_cup',_,_,Start), end('ev_2014_fifa_club_world_cup',_,_,End), Start=<End.

enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

generate_facts_ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933([]) :- assert(ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933(-1,-1)).

generate_facts_ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933([(Start,End) | Tail]) :- assert(ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933(Start,End)), generate_facts_ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933(Tail).

ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933_aux() :- findall((Start,End),ev_2014_fifa_club_world_cup(Start,End),Interval1), findall((Start,End),enabling_act_of_1933(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933(Interval).

ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933_at_1961(Res) :- setof((Start,End),ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933(Start,End),AllINtervals), checkvalidity(1961,AllINtervals,Res).

check_query() :- write('Query = ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933_at_1961'), (ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933_at_1961(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2014_fifa_club_world_cup_OR_enabling_act_of_1933_aux().

