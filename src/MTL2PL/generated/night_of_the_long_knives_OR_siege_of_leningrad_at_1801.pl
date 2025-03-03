:- include('database.pl').
night_of_the_long_knives(Start,End) :- begin('night_of_the_long_knives',_,_,Start), end('night_of_the_long_knives',_,_,End), Start=<End.

siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

generate_facts_night_of_the_long_knives_OR_siege_of_leningrad([]) :- assert(night_of_the_long_knives_OR_siege_of_leningrad(-1,-1)).

generate_facts_night_of_the_long_knives_OR_siege_of_leningrad([(Start,End) | Tail]) :- assert(night_of_the_long_knives_OR_siege_of_leningrad(Start,End)), generate_facts_night_of_the_long_knives_OR_siege_of_leningrad(Tail).

night_of_the_long_knives_OR_siege_of_leningrad_aux() :- findall((Start,End),night_of_the_long_knives(Start,End),Interval1), findall((Start,End),siege_of_leningrad(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_night_of_the_long_knives_OR_siege_of_leningrad(Interval).

night_of_the_long_knives_OR_siege_of_leningrad_at_1801(Res) :- setof((Start,End),night_of_the_long_knives_OR_siege_of_leningrad(Start,End),AllINtervals), checkvalidity(1801,AllINtervals,Res).

check_query() :- write('Query = night_of_the_long_knives_OR_siege_of_leningrad_at_1801'), (night_of_the_long_knives_OR_siege_of_leningrad_at_1801(true) -> write('\nRes   = true');write('\nRes   = false')).
?- night_of_the_long_knives_OR_siege_of_leningrad_aux().

