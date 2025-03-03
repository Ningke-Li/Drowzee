:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

chowder(Start,End) :- begin('chowder',_,_,Start), end('chowder',_,_,End), Start=<End.

generate_facts_convertible_peso_AND_chowder([]) :- assert(convertible_peso_AND_chowder(-1,-1)).

generate_facts_convertible_peso_AND_chowder([(Start,End) | Tail]) :- assert(convertible_peso_AND_chowder(Start,End)), generate_facts_convertible_peso_AND_chowder(Tail).

convertible_peso_AND_chowder_aux() :- findall((Start,End),convertible_peso(Start,End),Interval1), findall((Start,End),chowder(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_convertible_peso_AND_chowder(Interval).

convertible_peso_AND_chowder_at_2009(Res) :- setof((Start,End),convertible_peso_AND_chowder(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_AND_chowder_at_2009'), (convertible_peso_AND_chowder_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).
?- convertible_peso_AND_chowder_aux().

