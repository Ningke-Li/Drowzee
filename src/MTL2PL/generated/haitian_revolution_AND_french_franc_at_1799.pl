:- include('database.pl').
haitian_revolution(Start,End) :- begin('haitian_revolution',_,_,Start), end('haitian_revolution',_,_,End), Start=<End.

french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

generate_facts_haitian_revolution_AND_french_franc([]) :- assert(haitian_revolution_AND_french_franc(-1,-1)).

generate_facts_haitian_revolution_AND_french_franc([(Start,End) | Tail]) :- assert(haitian_revolution_AND_french_franc(Start,End)), generate_facts_haitian_revolution_AND_french_franc(Tail).

haitian_revolution_AND_french_franc_aux() :- findall((Start,End),haitian_revolution(Start,End),Interval1), findall((Start,End),french_franc(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_haitian_revolution_AND_french_franc(Interval).

haitian_revolution_AND_french_franc_at_1799(Res) :- setof((Start,End),haitian_revolution_AND_french_franc(Start,End),AllINtervals), checkvalidity(1799,AllINtervals,Res).

check_query() :- write('Query = haitian_revolution_AND_french_franc_at_1799'), (haitian_revolution_AND_french_franc_at_1799(true) -> write('\nRes   = true');write('\nRes   = false')).
?- haitian_revolution_AND_french_franc_aux().

