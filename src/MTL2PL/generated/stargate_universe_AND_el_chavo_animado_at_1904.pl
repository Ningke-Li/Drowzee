:- include('database.pl').
stargate_universe(Start,End) :- begin('stargate_universe',_,_,Start), end('stargate_universe',_,_,End), Start=<End.

el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

generate_facts_stargate_universe_AND_el_chavo_animado([]) :- assert(stargate_universe_AND_el_chavo_animado(-1,-1)).

generate_facts_stargate_universe_AND_el_chavo_animado([(Start,End) | Tail]) :- assert(stargate_universe_AND_el_chavo_animado(Start,End)), generate_facts_stargate_universe_AND_el_chavo_animado(Tail).

stargate_universe_AND_el_chavo_animado_aux() :- findall((Start,End),stargate_universe(Start,End),Interval1), findall((Start,End),el_chavo_animado(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_stargate_universe_AND_el_chavo_animado(Interval).

stargate_universe_AND_el_chavo_animado_at_1904(Res) :- setof((Start,End),stargate_universe_AND_el_chavo_animado(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = stargate_universe_AND_el_chavo_animado_at_1904'), (stargate_universe_AND_el_chavo_animado_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).
?- stargate_universe_AND_el_chavo_animado_aux().

