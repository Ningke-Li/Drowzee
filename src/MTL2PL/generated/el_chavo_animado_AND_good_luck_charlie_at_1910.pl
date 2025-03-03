:- include('database.pl').
el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

good_luck_charlie(Start,End) :- begin('good_luck_charlie',_,_,Start), end('good_luck_charlie',_,_,End), Start=<End.

generate_facts_el_chavo_animado_AND_good_luck_charlie([]) :- assert(el_chavo_animado_AND_good_luck_charlie(-1,-1)).

generate_facts_el_chavo_animado_AND_good_luck_charlie([(Start,End) | Tail]) :- assert(el_chavo_animado_AND_good_luck_charlie(Start,End)), generate_facts_el_chavo_animado_AND_good_luck_charlie(Tail).

el_chavo_animado_AND_good_luck_charlie_aux() :- findall((Start,End),el_chavo_animado(Start,End),Interval1), findall((Start,End),good_luck_charlie(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_el_chavo_animado_AND_good_luck_charlie(Interval).

el_chavo_animado_AND_good_luck_charlie_at_1910(Res) :- setof((Start,End),el_chavo_animado_AND_good_luck_charlie(Start,End),AllINtervals), checkvalidity(1910,AllINtervals,Res).

check_query() :- write('Query = el_chavo_animado_AND_good_luck_charlie_at_1910'), (el_chavo_animado_AND_good_luck_charlie_at_1910(true) -> write('\nRes   = true');write('\nRes   = false')).
?- el_chavo_animado_AND_good_luck_charlie_aux().

