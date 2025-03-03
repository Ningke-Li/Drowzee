:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

the_tudors(Start,End) :- begin('the_tudors',_,_,Start), end('the_tudors',_,_,End), Start=<End.

generate_facts_scooby_doo__mystery_incorporated_OR_the_tudors([]) :- assert(scooby_doo__mystery_incorporated_OR_the_tudors(-1,-1)).

generate_facts_scooby_doo__mystery_incorporated_OR_the_tudors([(Start,End) | Tail]) :- assert(scooby_doo__mystery_incorporated_OR_the_tudors(Start,End)), generate_facts_scooby_doo__mystery_incorporated_OR_the_tudors(Tail).

scooby_doo__mystery_incorporated_OR_the_tudors_aux() :- findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval1), findall((Start,End),the_tudors(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_scooby_doo__mystery_incorporated_OR_the_tudors(Interval).

scooby_doo__mystery_incorporated_OR_the_tudors_at_2018(Res) :- setof((Start,End),scooby_doo__mystery_incorporated_OR_the_tudors(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = scooby_doo__mystery_incorporated_OR_the_tudors_at_2018'), (scooby_doo__mystery_incorporated_OR_the_tudors_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scooby_doo__mystery_incorporated_OR_the_tudors_aux().

