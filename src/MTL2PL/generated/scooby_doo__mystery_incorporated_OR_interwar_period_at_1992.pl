:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

interwar_period(Start,End) :- begin('interwar_period',_,_,Start), end('interwar_period',_,_,End), Start=<End.

generate_facts_scooby_doo__mystery_incorporated_OR_interwar_period([]) :- assert(scooby_doo__mystery_incorporated_OR_interwar_period(-1,-1)).

generate_facts_scooby_doo__mystery_incorporated_OR_interwar_period([(Start,End) | Tail]) :- assert(scooby_doo__mystery_incorporated_OR_interwar_period(Start,End)), generate_facts_scooby_doo__mystery_incorporated_OR_interwar_period(Tail).

scooby_doo__mystery_incorporated_OR_interwar_period_aux() :- findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval1), findall((Start,End),interwar_period(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_scooby_doo__mystery_incorporated_OR_interwar_period(Interval).

scooby_doo__mystery_incorporated_OR_interwar_period_at_1992(Res) :- setof((Start,End),scooby_doo__mystery_incorporated_OR_interwar_period(Start,End),AllINtervals), checkvalidity(1992,AllINtervals,Res).

check_query() :- write('Query = scooby_doo__mystery_incorporated_OR_interwar_period_at_1992'), (scooby_doo__mystery_incorporated_OR_interwar_period_at_1992(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scooby_doo__mystery_incorporated_OR_interwar_period_aux().

