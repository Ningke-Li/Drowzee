:- include('database.pl').
silicon_valley(Start,End) :- begin('silicon_valley',_,_,Start), end('silicon_valley',_,_,End), Start=<End.

person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

generate_facts_silicon_valley_AND_person_of_interest([]) :- assert(silicon_valley_AND_person_of_interest(-1,-1)).

generate_facts_silicon_valley_AND_person_of_interest([(Start,End) | Tail]) :- assert(silicon_valley_AND_person_of_interest(Start,End)), generate_facts_silicon_valley_AND_person_of_interest(Tail).

silicon_valley_AND_person_of_interest_aux() :- findall((Start,End),silicon_valley(Start,End),Interval1), findall((Start,End),person_of_interest(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_silicon_valley_AND_person_of_interest(Interval).

silicon_valley_AND_person_of_interest_at_2014(Res) :- setof((Start,End),silicon_valley_AND_person_of_interest(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = silicon_valley_AND_person_of_interest_at_2014'), (silicon_valley_AND_person_of_interest_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).
?- silicon_valley_AND_person_of_interest_aux().

