:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

vikings(Start,End) :- begin('vikings',_,_,Start), end('vikings',_,_,End), Start=<End.

generate_facts_convertible_peso_AND_vikings([]) :- assert(convertible_peso_AND_vikings(-1,-1)).

generate_facts_convertible_peso_AND_vikings([(Start,End) | Tail]) :- assert(convertible_peso_AND_vikings(Start,End)), generate_facts_convertible_peso_AND_vikings(Tail).

convertible_peso_AND_vikings_aux() :- findall((Start,End),convertible_peso(Start,End),Interval1), findall((Start,End),vikings(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_convertible_peso_AND_vikings(Interval).

convertible_peso_AND_vikings_at_2018(Res) :- setof((Start,End),convertible_peso_AND_vikings(Start,End),AllINtervals), checkvalidity(2018,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_AND_vikings_at_2018'), (convertible_peso_AND_vikings_at_2018(true) -> write('\nRes   = true');write('\nRes   = false')).
?- convertible_peso_AND_vikings_aux().

