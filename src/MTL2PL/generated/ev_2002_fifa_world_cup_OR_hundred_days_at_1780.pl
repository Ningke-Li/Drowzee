:- include('database.pl').
ev_2002_fifa_world_cup(Start,End) :- begin('ev_2002_fifa_world_cup',_,_,Start), end('ev_2002_fifa_world_cup',_,_,End), Start=<End.

hundred_days(Start,End) :- begin('hundred_days',_,_,Start), end('hundred_days',_,_,End), Start=<End.

generate_facts_ev_2002_fifa_world_cup_OR_hundred_days([]) :- assert(ev_2002_fifa_world_cup_OR_hundred_days(-1,-1)).

generate_facts_ev_2002_fifa_world_cup_OR_hundred_days([(Start,End) | Tail]) :- assert(ev_2002_fifa_world_cup_OR_hundred_days(Start,End)), generate_facts_ev_2002_fifa_world_cup_OR_hundred_days(Tail).

ev_2002_fifa_world_cup_OR_hundred_days_aux() :- findall((Start,End),ev_2002_fifa_world_cup(Start,End),Interval1), findall((Start,End),hundred_days(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_ev_2002_fifa_world_cup_OR_hundred_days(Interval).

ev_2002_fifa_world_cup_OR_hundred_days_at_1780(Res) :- setof((Start,End),ev_2002_fifa_world_cup_OR_hundred_days(Start,End),AllINtervals), checkvalidity(1780,AllINtervals,Res).

check_query() :- write('Query = ev_2002_fifa_world_cup_OR_hundred_days_at_1780'), (ev_2002_fifa_world_cup_OR_hundred_days_at_1780(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2002_fifa_world_cup_OR_hundred_days_aux().

