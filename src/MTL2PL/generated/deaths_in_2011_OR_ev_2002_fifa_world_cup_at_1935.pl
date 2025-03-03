:- include('database.pl').
deaths_in_2011(Start,End) :- begin('deaths_in_2011',_,_,Start), end('deaths_in_2011',_,_,End), Start=<End.

ev_2002_fifa_world_cup(Start,End) :- begin('ev_2002_fifa_world_cup',_,_,Start), end('ev_2002_fifa_world_cup',_,_,End), Start=<End.

generate_facts_deaths_in_2011_OR_ev_2002_fifa_world_cup([]) :- assert(deaths_in_2011_OR_ev_2002_fifa_world_cup(-1,-1)).

generate_facts_deaths_in_2011_OR_ev_2002_fifa_world_cup([(Start,End) | Tail]) :- assert(deaths_in_2011_OR_ev_2002_fifa_world_cup(Start,End)), generate_facts_deaths_in_2011_OR_ev_2002_fifa_world_cup(Tail).

deaths_in_2011_OR_ev_2002_fifa_world_cup_aux() :- findall((Start,End),deaths_in_2011(Start,End),Interval1), findall((Start,End),ev_2002_fifa_world_cup(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_deaths_in_2011_OR_ev_2002_fifa_world_cup(Interval).

deaths_in_2011_OR_ev_2002_fifa_world_cup_at_1935(Res) :- setof((Start,End),deaths_in_2011_OR_ev_2002_fifa_world_cup(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = deaths_in_2011_OR_ev_2002_fifa_world_cup_at_1935'), (deaths_in_2011_OR_ev_2002_fifa_world_cup_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- deaths_in_2011_OR_ev_2002_fifa_world_cup_aux().

