:- include('database.pl').
slovak_national_uprising(Start,End) :- begin('slovak_national_uprising',_,_,Start), end('slovak_national_uprising',_,_,End), Start=<End.

the_tudors(Start,End) :- begin('the_tudors',_,_,Start), end('the_tudors',_,_,End), Start=<End.

generate_facts_slovak_national_uprising_OR_the_tudors([]) :- assert(slovak_national_uprising_OR_the_tudors(-1,-1)).

generate_facts_slovak_national_uprising_OR_the_tudors([(Start,End) | Tail]) :- assert(slovak_national_uprising_OR_the_tudors(Start,End)), generate_facts_slovak_national_uprising_OR_the_tudors(Tail).

slovak_national_uprising_OR_the_tudors_aux() :- findall((Start,End),slovak_national_uprising(Start,End),Interval1), findall((Start,End),the_tudors(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_slovak_national_uprising_OR_the_tudors(Interval).

slovak_national_uprising_OR_the_tudors_at_2007(Res) :- setof((Start,End),slovak_national_uprising_OR_the_tudors(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = slovak_national_uprising_OR_the_tudors_at_2007'), (slovak_national_uprising_OR_the_tudors_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).
?- slovak_national_uprising_OR_the_tudors_aux().

