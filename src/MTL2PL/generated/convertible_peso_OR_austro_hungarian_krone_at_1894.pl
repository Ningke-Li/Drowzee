:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

austro_hungarian_krone(Start,End) :- begin('austro_hungarian_krone',_,_,Start), end('austro_hungarian_krone',_,_,End), Start=<End.

generate_facts_convertible_peso_OR_austro_hungarian_krone([]) :- assert(convertible_peso_OR_austro_hungarian_krone(-1,-1)).

generate_facts_convertible_peso_OR_austro_hungarian_krone([(Start,End) | Tail]) :- assert(convertible_peso_OR_austro_hungarian_krone(Start,End)), generate_facts_convertible_peso_OR_austro_hungarian_krone(Tail).

convertible_peso_OR_austro_hungarian_krone_aux() :- findall((Start,End),convertible_peso(Start,End),Interval1), findall((Start,End),austro_hungarian_krone(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_convertible_peso_OR_austro_hungarian_krone(Interval).

convertible_peso_OR_austro_hungarian_krone_at_1894(Res) :- setof((Start,End),convertible_peso_OR_austro_hungarian_krone(Start,End),AllINtervals), checkvalidity(1894,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_OR_austro_hungarian_krone_at_1894'), (convertible_peso_OR_austro_hungarian_krone_at_1894(true) -> write('\nRes   = true');write('\nRes   = false')).
?- convertible_peso_OR_austro_hungarian_krone_aux().

