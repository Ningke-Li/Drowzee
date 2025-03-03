:- include('database.pl').
green_revolution(Start,End) :- begin('green_revolution',_,_,Start), end('green_revolution',_,_,End), Start=<End.

siege_of_leningrad(Start,End) :- begin('siege_of_leningrad',_,_,Start), end('siege_of_leningrad',_,_,End), Start=<End.

generate_facts_green_revolution_AND_siege_of_leningrad([]) :- assert(green_revolution_AND_siege_of_leningrad(-1,-1)).

generate_facts_green_revolution_AND_siege_of_leningrad([(Start,End) | Tail]) :- assert(green_revolution_AND_siege_of_leningrad(Start,End)), generate_facts_green_revolution_AND_siege_of_leningrad(Tail).

green_revolution_AND_siege_of_leningrad_aux() :- findall((Start,End),green_revolution(Start,End),Interval1), findall((Start,End),siege_of_leningrad(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_green_revolution_AND_siege_of_leningrad(Interval).

green_revolution_AND_siege_of_leningrad_at_1832(Res) :- setof((Start,End),green_revolution_AND_siege_of_leningrad(Start,End),AllINtervals), checkvalidity(1832,AllINtervals,Res).

check_query() :- write('Query = green_revolution_AND_siege_of_leningrad_at_1832'), (green_revolution_AND_siege_of_leningrad_at_1832(true) -> write('\nRes   = true');write('\nRes   = false')).
?- green_revolution_AND_siege_of_leningrad_aux().

