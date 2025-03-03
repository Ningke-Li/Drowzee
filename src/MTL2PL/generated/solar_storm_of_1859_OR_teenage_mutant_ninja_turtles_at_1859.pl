:- include('database.pl').
solar_storm_of_1859(Start,End) :- begin('solar_storm_of_1859',_,_,Start), end('solar_storm_of_1859',_,_,End), Start=<End.

teenage_mutant_ninja_turtles(Start,End) :- begin('teenage_mutant_ninja_turtles',_,_,Start), end('teenage_mutant_ninja_turtles',_,_,End), Start=<End.

generate_facts_solar_storm_of_1859_OR_teenage_mutant_ninja_turtles([]) :- assert(solar_storm_of_1859_OR_teenage_mutant_ninja_turtles(-1,-1)).

generate_facts_solar_storm_of_1859_OR_teenage_mutant_ninja_turtles([(Start,End) | Tail]) :- assert(solar_storm_of_1859_OR_teenage_mutant_ninja_turtles(Start,End)), generate_facts_solar_storm_of_1859_OR_teenage_mutant_ninja_turtles(Tail).

solar_storm_of_1859_OR_teenage_mutant_ninja_turtles_aux() :- findall((Start,End),solar_storm_of_1859(Start,End),Interval1), findall((Start,End),teenage_mutant_ninja_turtles(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_solar_storm_of_1859_OR_teenage_mutant_ninja_turtles(Interval).

solar_storm_of_1859_OR_teenage_mutant_ninja_turtles_at_1859(Res) :- setof((Start,End),solar_storm_of_1859_OR_teenage_mutant_ninja_turtles(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = solar_storm_of_1859_OR_teenage_mutant_ninja_turtles_at_1859'), (solar_storm_of_1859_OR_teenage_mutant_ninja_turtles_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).
?- solar_storm_of_1859_OR_teenage_mutant_ninja_turtles_aux().

