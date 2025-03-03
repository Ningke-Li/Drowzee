:- include('database.pl').
occupation_of_the_ruhr(Start,End) :- begin('occupation_of_the_ruhr',_,_,Start), end('occupation_of_the_ruhr',_,_,End), Start=<End.

scramble_for_africa(Start,End) :- begin('scramble_for_africa',_,_,Start), end('scramble_for_africa',_,_,End), Start=<End.

generate_facts_occupation_of_the_ruhr_OR_scramble_for_africa([]) :- assert(occupation_of_the_ruhr_OR_scramble_for_africa(-1,-1)).

generate_facts_occupation_of_the_ruhr_OR_scramble_for_africa([(Start,End) | Tail]) :- assert(occupation_of_the_ruhr_OR_scramble_for_africa(Start,End)), generate_facts_occupation_of_the_ruhr_OR_scramble_for_africa(Tail).

occupation_of_the_ruhr_OR_scramble_for_africa_aux() :- findall((Start,End),occupation_of_the_ruhr(Start,End),Interval1), findall((Start,End),scramble_for_africa(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_occupation_of_the_ruhr_OR_scramble_for_africa(Interval).

occupation_of_the_ruhr_OR_scramble_for_africa_at_1772(Res) :- setof((Start,End),occupation_of_the_ruhr_OR_scramble_for_africa(Start,End),AllINtervals), checkvalidity(1772,AllINtervals,Res).

check_query() :- write('Query = occupation_of_the_ruhr_OR_scramble_for_africa_at_1772'), (occupation_of_the_ruhr_OR_scramble_for_africa_at_1772(true) -> write('\nRes   = true');write('\nRes   = false')).
?- occupation_of_the_ruhr_OR_scramble_for_africa_aux().

