:- include('database.pl').
ev_2013_14_serie_a(Start,End) :- begin('ev_2013_14_serie_a',_,_,Start), end('ev_2013_14_serie_a',_,_,End), Start=<End.

el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

generate_facts_ev_2013_14_serie_a_AND_el_chavo_animado([]) :- assert(ev_2013_14_serie_a_AND_el_chavo_animado(-1,-1)).

generate_facts_ev_2013_14_serie_a_AND_el_chavo_animado([(Start,End) | Tail]) :- assert(ev_2013_14_serie_a_AND_el_chavo_animado(Start,End)), generate_facts_ev_2013_14_serie_a_AND_el_chavo_animado(Tail).

ev_2013_14_serie_a_AND_el_chavo_animado_aux() :- findall((Start,End),ev_2013_14_serie_a(Start,End),Interval1), findall((Start,End),el_chavo_animado(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2013_14_serie_a_AND_el_chavo_animado(Interval).

ev_2013_14_serie_a_AND_el_chavo_animado_at_2001(Res) :- setof((Start,End),ev_2013_14_serie_a_AND_el_chavo_animado(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = ev_2013_14_serie_a_AND_el_chavo_animado_at_2001'), (ev_2013_14_serie_a_AND_el_chavo_animado_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2013_14_serie_a_AND_el_chavo_animado_aux().

