:- include('database.pl').
time_of_troubles(Start,End) :- begin('time_of_troubles',_,_,Start), end('time_of_troubles',_,_,End), Start=<End.

ev_2008_summer_paralympics(Start,End) :- begin('ev_2008_summer_paralympics',_,_,Start), end('ev_2008_summer_paralympics',_,_,End), Start=<End.

generate_facts_time_of_troubles_OR_ev_2008_summer_paralympics([]) :- assert(time_of_troubles_OR_ev_2008_summer_paralympics(-1,-1)).

generate_facts_time_of_troubles_OR_ev_2008_summer_paralympics([(Start,End) | Tail]) :- assert(time_of_troubles_OR_ev_2008_summer_paralympics(Start,End)), generate_facts_time_of_troubles_OR_ev_2008_summer_paralympics(Tail).

time_of_troubles_OR_ev_2008_summer_paralympics_aux() :- findall((Start,End),time_of_troubles(Start,End),Interval1), findall((Start,End),ev_2008_summer_paralympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_time_of_troubles_OR_ev_2008_summer_paralympics(Interval).

time_of_troubles_OR_ev_2008_summer_paralympics_at_1607(Res) :- setof((Start,End),time_of_troubles_OR_ev_2008_summer_paralympics(Start,End),AllINtervals), checkvalidity(1607,AllINtervals,Res).

check_query() :- write('Query = time_of_troubles_OR_ev_2008_summer_paralympics_at_1607'), (time_of_troubles_OR_ev_2008_summer_paralympics_at_1607(true) -> write('\nRes   = true');write('\nRes   = false')).
?- time_of_troubles_OR_ev_2008_summer_paralympics_aux().

