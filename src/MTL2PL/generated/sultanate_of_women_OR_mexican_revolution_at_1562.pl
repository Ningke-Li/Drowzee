:- include('database.pl').
sultanate_of_women(Start,End) :- begin('sultanate_of_women',_,_,Start), end('sultanate_of_women',_,_,End), Start=<End.

mexican_revolution(Start,End) :- begin('mexican_revolution',_,_,Start), end('mexican_revolution',_,_,End), Start=<End.

generate_facts_sultanate_of_women_OR_mexican_revolution([]) :- assert(sultanate_of_women_OR_mexican_revolution(-1,-1)).

generate_facts_sultanate_of_women_OR_mexican_revolution([(Start,End) | Tail]) :- assert(sultanate_of_women_OR_mexican_revolution(Start,End)), generate_facts_sultanate_of_women_OR_mexican_revolution(Tail).

sultanate_of_women_OR_mexican_revolution_aux() :- findall((Start,End),sultanate_of_women(Start,End),Interval1), findall((Start,End),mexican_revolution(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_sultanate_of_women_OR_mexican_revolution(Interval).

sultanate_of_women_OR_mexican_revolution_at_1562(Res) :- setof((Start,End),sultanate_of_women_OR_mexican_revolution(Start,End),AllINtervals), checkvalidity(1562,AllINtervals,Res).

check_query() :- write('Query = sultanate_of_women_OR_mexican_revolution_at_1562'), (sultanate_of_women_OR_mexican_revolution_at_1562(true) -> write('\nRes   = true');write('\nRes   = false')).
?- sultanate_of_women_OR_mexican_revolution_aux().

