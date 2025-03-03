:- include('database.pl').
el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

the_wire(Start,End) :- begin('the_wire',_,_,Start), end('the_wire',_,_,End), Start=<End.

generate_facts_el_chavo_animado_AND_the_wire([]) :- assert(el_chavo_animado_AND_the_wire(-1,-1)).

generate_facts_el_chavo_animado_AND_the_wire([(Start,End) | Tail]) :- assert(el_chavo_animado_AND_the_wire(Start,End)), generate_facts_el_chavo_animado_AND_the_wire(Tail).

el_chavo_animado_AND_the_wire_aux() :- findall((Start,End),el_chavo_animado(Start,End),Interval1), findall((Start,End),the_wire(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_el_chavo_animado_AND_the_wire(Interval).

el_chavo_animado_AND_the_wire_at_1872(Res) :- setof((Start,End),el_chavo_animado_AND_the_wire(Start,End),AllINtervals), checkvalidity(1872,AllINtervals,Res).

check_query() :- write('Query = el_chavo_animado_AND_the_wire_at_1872'), (el_chavo_animado_AND_the_wire_at_1872(true) -> write('\nRes   = true');write('\nRes   = false')).
?- el_chavo_animado_AND_the_wire_aux().

