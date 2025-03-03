:- include('database.pl').
counter_reformation(Start,End) :- begin('counter_reformation',_,_,Start), end('counter_reformation',_,_,End), Start=<End.

speed_skating_at_the_2014_winter_olympics(Start,End) :- begin('speed_skating_at_the_2014_winter_olympics',_,_,Start), end('speed_skating_at_the_2014_winter_olympics',_,_,End), Start=<End.

generate_facts_counter_reformation_OR_speed_skating_at_the_2014_winter_olympics([]) :- assert(counter_reformation_OR_speed_skating_at_the_2014_winter_olympics(-1,-1)).

generate_facts_counter_reformation_OR_speed_skating_at_the_2014_winter_olympics([(Start,End) | Tail]) :- assert(counter_reformation_OR_speed_skating_at_the_2014_winter_olympics(Start,End)), generate_facts_counter_reformation_OR_speed_skating_at_the_2014_winter_olympics(Tail).

counter_reformation_OR_speed_skating_at_the_2014_winter_olympics_aux() :- findall((Start,End),counter_reformation(Start,End),Interval1), findall((Start,End),speed_skating_at_the_2014_winter_olympics(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_counter_reformation_OR_speed_skating_at_the_2014_winter_olympics(Interval).

counter_reformation_OR_speed_skating_at_the_2014_winter_olympics_at_2042(Res) :- setof((Start,End),counter_reformation_OR_speed_skating_at_the_2014_winter_olympics(Start,End),AllINtervals), checkvalidity(2042,AllINtervals,Res).

check_query() :- write('Query = counter_reformation_OR_speed_skating_at_the_2014_winter_olympics_at_2042'), (counter_reformation_OR_speed_skating_at_the_2014_winter_olympics_at_2042(true) -> write('\nRes   = true');write('\nRes   = false')).
?- counter_reformation_OR_speed_skating_at_the_2014_winter_olympics_aux().

