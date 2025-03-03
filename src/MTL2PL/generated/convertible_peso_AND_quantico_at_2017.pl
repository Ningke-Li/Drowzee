:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

quantico(Start,End) :- begin('quantico',_,_,Start), end('quantico',_,_,End), Start=<End.

generate_facts_convertible_peso_AND_quantico([]) :- assert(convertible_peso_AND_quantico(-1,-1)).

generate_facts_convertible_peso_AND_quantico([(Start,End) | Tail]) :- assert(convertible_peso_AND_quantico(Start,End)), generate_facts_convertible_peso_AND_quantico(Tail).

convertible_peso_AND_quantico_aux() :- findall((Start,End),convertible_peso(Start,End),Interval1), findall((Start,End),quantico(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_convertible_peso_AND_quantico(Interval).

convertible_peso_AND_quantico_at_2017(Res) :- setof((Start,End),convertible_peso_AND_quantico(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_AND_quantico_at_2017'), (convertible_peso_AND_quantico_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).
?- convertible_peso_AND_quantico_aux().

