:- include('database.pl').
vistula_oder_offensive(Start,End) :- begin('vistula_oder_offensive',_,_,Start), end('vistula_oder_offensive',_,_,End), Start=<End.

night_of_the_long_knives(Start,End) :- begin('night_of_the_long_knives',_,_,Start), end('night_of_the_long_knives',_,_,End), Start=<End.

generate_facts_vistula_oder_offensive_OR_night_of_the_long_knives([]) :- assert(vistula_oder_offensive_OR_night_of_the_long_knives(-1,-1)).

generate_facts_vistula_oder_offensive_OR_night_of_the_long_knives([(Start,End) | Tail]) :- assert(vistula_oder_offensive_OR_night_of_the_long_knives(Start,End)), generate_facts_vistula_oder_offensive_OR_night_of_the_long_knives(Tail).

vistula_oder_offensive_OR_night_of_the_long_knives_aux() :- findall((Start,End),vistula_oder_offensive(Start,End),Interval1), findall((Start,End),night_of_the_long_knives(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_vistula_oder_offensive_OR_night_of_the_long_knives(Interval).

vistula_oder_offensive_OR_night_of_the_long_knives_at_1876(Res) :- setof((Start,End),vistula_oder_offensive_OR_night_of_the_long_knives(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = vistula_oder_offensive_OR_night_of_the_long_knives_at_1876'), (vistula_oder_offensive_OR_night_of_the_long_knives_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).
?- vistula_oder_offensive_OR_night_of_the_long_knives_aux().

