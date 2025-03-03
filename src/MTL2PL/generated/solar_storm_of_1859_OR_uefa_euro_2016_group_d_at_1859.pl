:- include('database.pl').
solar_storm_of_1859(Start,End) :- begin('solar_storm_of_1859',_,_,Start), end('solar_storm_of_1859',_,_,End), Start=<End.

uefa_euro_2016_group_d(Start,End) :- begin('uefa_euro_2016_group_d',_,_,Start), end('uefa_euro_2016_group_d',_,_,End), Start=<End.

generate_facts_solar_storm_of_1859_OR_uefa_euro_2016_group_d([]) :- assert(solar_storm_of_1859_OR_uefa_euro_2016_group_d(-1,-1)).

generate_facts_solar_storm_of_1859_OR_uefa_euro_2016_group_d([(Start,End) | Tail]) :- assert(solar_storm_of_1859_OR_uefa_euro_2016_group_d(Start,End)), generate_facts_solar_storm_of_1859_OR_uefa_euro_2016_group_d(Tail).

solar_storm_of_1859_OR_uefa_euro_2016_group_d_aux() :- findall((Start,End),solar_storm_of_1859(Start,End),Interval1), findall((Start,End),uefa_euro_2016_group_d(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_solar_storm_of_1859_OR_uefa_euro_2016_group_d(Interval).

solar_storm_of_1859_OR_uefa_euro_2016_group_d_at_1859(Res) :- setof((Start,End),solar_storm_of_1859_OR_uefa_euro_2016_group_d(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = solar_storm_of_1859_OR_uefa_euro_2016_group_d_at_1859'), (solar_storm_of_1859_OR_uefa_euro_2016_group_d_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).
?- solar_storm_of_1859_OR_uefa_euro_2016_group_d_aux().

