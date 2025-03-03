:- include('database.pl').
mediterranean_and_middle_east_theater_of_world_war_ii(Start,End) :- begin('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,Start), end('mediterranean_and_middle_east_theater_of_world_war_ii',_,_,End), Start=<End.

veronica_mars(Start,End) :- begin('veronica_mars',_,_,Start), end('veronica_mars',_,_,End), Start=<End.

generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars([]) :- assert(mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars(-1,-1)).

generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars([(Start,End) | Tail]) :- assert(mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars(Start,End)), generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars(Tail).

mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars_aux() :- findall((Start,End),mediterranean_and_middle_east_theater_of_world_war_ii(Start,End),Interval1), findall((Start,End),veronica_mars(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars(Interval).

mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars_at_1973(Res) :- setof((Start,End),mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars(Start,End),AllINtervals), checkvalidity(1973,AllINtervals,Res).

check_query() :- write('Query = mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars_at_1973'), (mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars_at_1973(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mediterranean_and_middle_east_theater_of_world_war_ii_OR_veronica_mars_aux().

