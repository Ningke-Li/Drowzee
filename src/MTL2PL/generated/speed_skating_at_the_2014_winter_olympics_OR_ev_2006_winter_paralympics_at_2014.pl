:- include('database.pl').
speed_skating_at_the_2014_winter_olympics(Start,End) :- begin('speed_skating_at_the_2014_winter_olympics',_,_,Start), end('speed_skating_at_the_2014_winter_olympics',_,_,End), Start=<End.

ev_2006_winter_paralympics(Start,End) :- begin('ev_2006_winter_paralympics',_,_,Start), end('ev_2006_winter_paralympics',_,_,End), Start=<End.

generate_facts_speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics([]) :- assert(speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics(-1,-1)).

generate_facts_speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics([(Start,End) | Tail]) :- assert(speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics(Start,End)), generate_facts_speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics(Tail).

speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics_aux() :- findall((Start,End),speed_skating_at_the_2014_winter_olympics(Start,End),Interval1), findall((Start,End),ev_2006_winter_paralympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics(Interval).

speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics_at_2014(Res) :- setof((Start,End),speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics_at_2014'), (speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- speed_skating_at_the_2014_winter_olympics_OR_ev_2006_winter_paralympics_aux().

