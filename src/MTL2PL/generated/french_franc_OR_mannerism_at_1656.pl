:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

mannerism(Start,End) :- begin('mannerism',_,_,Start), end('mannerism',_,_,End), Start=<End.

generate_facts_french_franc_OR_mannerism([]) :- assert(french_franc_OR_mannerism(-1,-1)).

generate_facts_french_franc_OR_mannerism([(Start,End) | Tail]) :- assert(french_franc_OR_mannerism(Start,End)), generate_facts_french_franc_OR_mannerism(Tail).

french_franc_OR_mannerism_aux() :- findall((Start,End),french_franc(Start,End),Interval1), findall((Start,End),mannerism(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_french_franc_OR_mannerism(Interval).

french_franc_OR_mannerism_at_1656(Res) :- setof((Start,End),french_franc_OR_mannerism(Start,End),AllINtervals), checkvalidity(1656,AllINtervals,Res).

check_query() :- write('Query = french_franc_OR_mannerism_at_1656'), (french_franc_OR_mannerism_at_1656(true) -> write('\nRes   = true');write('\nRes   = false')).
?- french_franc_OR_mannerism_aux().

