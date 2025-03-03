:- include('database.pl').
beer_hall_putsch(Start,End) :- begin('beer_hall_putsch',_,_,Start), end('beer_hall_putsch',_,_,End), Start=<End.

silicon_valley(Start,End) :- begin('silicon_valley',_,_,Start), end('silicon_valley',_,_,End), Start=<End.

generate_facts_beer_hall_putsch_OR_silicon_valley([]) :- assert(beer_hall_putsch_OR_silicon_valley(-1,-1)).

generate_facts_beer_hall_putsch_OR_silicon_valley([(Start,End) | Tail]) :- assert(beer_hall_putsch_OR_silicon_valley(Start,End)), generate_facts_beer_hall_putsch_OR_silicon_valley(Tail).

beer_hall_putsch_OR_silicon_valley_aux() :- findall((Start,End),beer_hall_putsch(Start,End),Interval1), findall((Start,End),silicon_valley(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_beer_hall_putsch_OR_silicon_valley(Interval).

beer_hall_putsch_OR_silicon_valley_at_1880(Res) :- setof((Start,End),beer_hall_putsch_OR_silicon_valley(Start,End),AllINtervals), checkvalidity(1880,AllINtervals,Res).

check_query() :- write('Query = beer_hall_putsch_OR_silicon_valley_at_1880'), (beer_hall_putsch_OR_silicon_valley_at_1880(true) -> write('\nRes   = true');write('\nRes   = false')).
?- beer_hall_putsch_OR_silicon_valley_aux().

