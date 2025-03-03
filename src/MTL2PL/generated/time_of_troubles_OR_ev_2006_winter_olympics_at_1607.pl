:- include('database.pl').
time_of_troubles(Start,End) :- begin('time_of_troubles',_,_,Start), end('time_of_troubles',_,_,End), Start=<End.

ev_2006_winter_olympics(Start,End) :- begin('ev_2006_winter_olympics',_,_,Start), end('ev_2006_winter_olympics',_,_,End), Start=<End.

generate_facts_time_of_troubles_OR_ev_2006_winter_olympics([]) :- assert(time_of_troubles_OR_ev_2006_winter_olympics(-1,-1)).

generate_facts_time_of_troubles_OR_ev_2006_winter_olympics([(Start,End) | Tail]) :- assert(time_of_troubles_OR_ev_2006_winter_olympics(Start,End)), generate_facts_time_of_troubles_OR_ev_2006_winter_olympics(Tail).

time_of_troubles_OR_ev_2006_winter_olympics_aux() :- findall((Start,End),time_of_troubles(Start,End),Interval1), findall((Start,End),ev_2006_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_time_of_troubles_OR_ev_2006_winter_olympics(Interval).

time_of_troubles_OR_ev_2006_winter_olympics_at_1607(Res) :- setof((Start,End),time_of_troubles_OR_ev_2006_winter_olympics(Start,End),AllINtervals), checkvalidity(1607,AllINtervals,Res).

check_query() :- write('Query = time_of_troubles_OR_ev_2006_winter_olympics_at_1607'), (time_of_troubles_OR_ev_2006_winter_olympics_at_1607(true) -> write('\nRes   = true');write('\nRes   = false')).
?- time_of_troubles_OR_ev_2006_winter_olympics_aux().

