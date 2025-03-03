:- include('database.pl').
person_of_interest(Start,End) :- begin('person_of_interest',_,_,Start), end('person_of_interest',_,_,End), Start=<End.

scandal(Start,End) :- begin('scandal',_,_,Start), end('scandal',_,_,End), Start=<End.

generate_facts_person_of_interest_AND_scandal([]) :- assert(person_of_interest_AND_scandal(-1,-1)).

generate_facts_person_of_interest_AND_scandal([(Start,End) | Tail]) :- assert(person_of_interest_AND_scandal(Start,End)), generate_facts_person_of_interest_AND_scandal(Tail).

person_of_interest_AND_scandal_aux() :- findall((Start,End),person_of_interest(Start,End),Interval1), findall((Start,End),scandal(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_person_of_interest_AND_scandal(Interval).

person_of_interest_AND_scandal_at_1870(Res) :- setof((Start,End),person_of_interest_AND_scandal(Start,End),AllINtervals), checkvalidity(1870,AllINtervals,Res).

check_query() :- write('Query = person_of_interest_AND_scandal_at_1870'), (person_of_interest_AND_scandal_at_1870(true) -> write('\nRes   = true');write('\nRes   = false')).
?- person_of_interest_AND_scandal_aux().

