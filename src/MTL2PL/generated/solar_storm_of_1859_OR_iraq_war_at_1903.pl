:- include('database.pl').
solar_storm_of_1859(Start,End) :- begin('solar_storm_of_1859',_,_,Start), end('solar_storm_of_1859',_,_,End), Start=<End.

iraq_war(Start,End) :- begin('iraq_war',_,_,Start), end('iraq_war',_,_,End), Start=<End.

generate_facts_solar_storm_of_1859_OR_iraq_war([]) :- assert(solar_storm_of_1859_OR_iraq_war(-1,-1)).

generate_facts_solar_storm_of_1859_OR_iraq_war([(Start,End) | Tail]) :- assert(solar_storm_of_1859_OR_iraq_war(Start,End)), generate_facts_solar_storm_of_1859_OR_iraq_war(Tail).

solar_storm_of_1859_OR_iraq_war_aux() :- findall((Start,End),solar_storm_of_1859(Start,End),Interval1), findall((Start,End),iraq_war(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_solar_storm_of_1859_OR_iraq_war(Interval).

solar_storm_of_1859_OR_iraq_war_at_1903(Res) :- setof((Start,End),solar_storm_of_1859_OR_iraq_war(Start,End),AllINtervals), checkvalidity(1903,AllINtervals,Res).

check_query() :- write('Query = solar_storm_of_1859_OR_iraq_war_at_1903'), (solar_storm_of_1859_OR_iraq_war_at_1903(true) -> write('\nRes   = true');write('\nRes   = false')).
?- solar_storm_of_1859_OR_iraq_war_aux().

