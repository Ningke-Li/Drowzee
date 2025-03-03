:- include('database.pl').
scooby_doo__mystery_incorporated(Start,End) :- begin('scooby_doo__mystery_incorporated',_,_,Start), end('scooby_doo__mystery_incorporated',_,_,End), Start=<End.

veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

generate_facts_scooby_doo__mystery_incorporated_AND_veronica_mars([]) :- assert(scooby_doo__mystery_incorporated_AND_veronica_mars(-1,-1)).

generate_facts_scooby_doo__mystery_incorporated_AND_veronica_mars([(Start,End) | Tail]) :- assert(scooby_doo__mystery_incorporated_AND_veronica_mars(Start,End)), generate_facts_scooby_doo__mystery_incorporated_AND_veronica_mars(Tail).

scooby_doo__mystery_incorporated_AND_veronica_mars_aux() :- findall((Start,End),scooby_doo__mystery_incorporated(Start,End),Interval1), findall((Start,End),veronica_mars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_scooby_doo__mystery_incorporated_AND_veronica_mars(Interval).

scooby_doo__mystery_incorporated_AND_veronica_mars_at_2036(Res) :- setof((Start,End),scooby_doo__mystery_incorporated_AND_veronica_mars(Start,End),AllINtervals), checkvalidity(2036,AllINtervals,Res).

check_query() :- write('Query = scooby_doo__mystery_incorporated_AND_veronica_mars_at_2036'), (scooby_doo__mystery_incorporated_AND_veronica_mars_at_2036(true) -> write('\nRes   = true');write('\nRes   = false')).
?- scooby_doo__mystery_incorporated_AND_veronica_mars_aux().

