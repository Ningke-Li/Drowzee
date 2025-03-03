:- include('database.pl').
the_office(Start,End) :- begin('the_office',_,_,Start), end('the_office',_,_,End), Start=<End.

westerplatte(Start,End) :- begin('westerplatte',_,_,Start), end('westerplatte',_,_,End), Start=<End.

generate_facts_the_office_OR_westerplatte([]) :- assert(the_office_OR_westerplatte(-1,-1)).

generate_facts_the_office_OR_westerplatte([(Start,End) | Tail]) :- assert(the_office_OR_westerplatte(Start,End)), generate_facts_the_office_OR_westerplatte(Tail).

the_office_OR_westerplatte_aux() :- findall((Start,End),the_office(Start,End),Interval1), findall((Start,End),westerplatte(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_the_office_OR_westerplatte(Interval).

the_office_OR_westerplatte_at_1916(Res) :- setof((Start,End),the_office_OR_westerplatte(Start,End),AllINtervals), checkvalidity(1916,AllINtervals,Res).

check_query() :- write('Query = the_office_OR_westerplatte_at_1916'), (the_office_OR_westerplatte_at_1916(true) -> write('\nRes   = true');write('\nRes   = false')).
?- the_office_OR_westerplatte_aux().

