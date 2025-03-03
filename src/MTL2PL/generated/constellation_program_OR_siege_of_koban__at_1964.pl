:- include('database.pl').
constellation_program(Start,End) :- begin('constellation_program',_,_,Start), end('constellation_program',_,_,End), Start=<End.

siege_of_koban_(Start,End) :- begin('siege_of_koban_',_,_,Start), end('siege_of_koban_',_,_,End), Start=<End.

generate_facts_constellation_program_OR_siege_of_koban_([]) :- assert(constellation_program_OR_siege_of_koban_(-1,-1)).

generate_facts_constellation_program_OR_siege_of_koban_([(Start,End) | Tail]) :- assert(constellation_program_OR_siege_of_koban_(Start,End)), generate_facts_constellation_program_OR_siege_of_koban_(Tail).

constellation_program_OR_siege_of_koban__aux() :- findall((Start,End),constellation_program(Start,End),Interval1), findall((Start,End),siege_of_koban_(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_constellation_program_OR_siege_of_koban_(Interval).

constellation_program_OR_siege_of_koban__at_1964(Res) :- setof((Start,End),constellation_program_OR_siege_of_koban_(Start,End),AllINtervals), checkvalidity(1964,AllINtervals,Res).

check_query() :- write('Query = constellation_program_OR_siege_of_koban__at_1964'), (constellation_program_OR_siege_of_koban__at_1964(true) -> write('\nRes   = true');write('\nRes   = false')).
?- constellation_program_OR_siege_of_koban__aux().

