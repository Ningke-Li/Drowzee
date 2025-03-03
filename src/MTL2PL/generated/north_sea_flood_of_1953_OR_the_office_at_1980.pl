:- include('database.pl').
north_sea_flood_of_1953(Start,End) :- begin('north_sea_flood_of_1953',_,_,Start), end('north_sea_flood_of_1953',_,_,End), Start=<End.

the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

generate_facts_north_sea_flood_of_1953_OR_the_office([]) :- assert(north_sea_flood_of_1953_OR_the_office(-1,-1)).

generate_facts_north_sea_flood_of_1953_OR_the_office([(Start,End) | Tail]) :- assert(north_sea_flood_of_1953_OR_the_office(Start,End)), generate_facts_north_sea_flood_of_1953_OR_the_office(Tail).

north_sea_flood_of_1953_OR_the_office_aux() :- findall((Start,End),north_sea_flood_of_1953(Start,End),Interval1), findall((Start,End),the_office(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_north_sea_flood_of_1953_OR_the_office(Interval).

north_sea_flood_of_1953_OR_the_office_at_1980(Res) :- setof((Start,End),north_sea_flood_of_1953_OR_the_office(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = north_sea_flood_of_1953_OR_the_office_at_1980'), (north_sea_flood_of_1953_OR_the_office_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).
?- north_sea_flood_of_1953_OR_the_office_aux().

