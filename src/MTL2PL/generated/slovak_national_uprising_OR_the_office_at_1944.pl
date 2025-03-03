:- include('database.pl').
slovak_national_uprising(Start,End) :- begin('slovak_national_uprising',_,_,Start), end('slovak_national_uprising',_,_,End), Start=<End.

the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

generate_facts_slovak_national_uprising_OR_the_office([]) :- assert(slovak_national_uprising_OR_the_office(-1,-1)).

generate_facts_slovak_national_uprising_OR_the_office([(Start,End) | Tail]) :- assert(slovak_national_uprising_OR_the_office(Start,End)), generate_facts_slovak_national_uprising_OR_the_office(Tail).

slovak_national_uprising_OR_the_office_aux() :- findall((Start,End),slovak_national_uprising(Start,End),Interval1), findall((Start,End),the_office(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_slovak_national_uprising_OR_the_office(Interval).

slovak_national_uprising_OR_the_office_at_1944(Res) :- setof((Start,End),slovak_national_uprising_OR_the_office(Start,End),AllINtervals), checkvalidity(1944,AllINtervals,Res).

check_query() :- write('Query = slovak_national_uprising_OR_the_office_at_1944'), (slovak_national_uprising_OR_the_office_at_1944(true) -> write('\nRes   = true');write('\nRes   = false')).
?- slovak_national_uprising_OR_the_office_aux().

