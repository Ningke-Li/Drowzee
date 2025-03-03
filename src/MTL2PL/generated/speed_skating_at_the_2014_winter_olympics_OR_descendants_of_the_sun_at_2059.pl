:- include('database.pl').
speed_skating_at_the_2014_winter_olympics(Start,End) :- begin('speed_skating_at_the_2014_winter_olympics',_,_,Start), end('speed_skating_at_the_2014_winter_olympics',_,_,End), Start=<End.

descendants_of_the_sun(Start,End) :- begin('descendants_of_the_sun',_,_,Start), end('descendants_of_the_sun',_,_,End), Start=<End.

generate_facts_speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun([]) :- assert(speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun(-1,-1)).

generate_facts_speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun([(Start,End) | Tail]) :- assert(speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun(Start,End)), generate_facts_speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun(Tail).

speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun_aux() :- findall((Start,End),speed_skating_at_the_2014_winter_olympics(Start,End),Interval1), findall((Start,End),descendants_of_the_sun(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun(Interval).

speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun_at_2059(Res) :- setof((Start,End),speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun(Start,End),AllINtervals), checkvalidity(2059,AllINtervals,Res).

check_query() :- write('Query = speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun_at_2059'), (speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun_at_2059(true) -> write('\nRes   = true');write('\nRes   = false')).
?- speed_skating_at_the_2014_winter_olympics_OR_descendants_of_the_sun_aux().

