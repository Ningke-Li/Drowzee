:- include('database.pl').
el_chavo_animado(Start,End) :- begin('el_chavo_animado',_,_,Start), end('el_chavo_animado',_,_,End), Start=<End.

ben_10__alien_force(Start,End) :- begin('ben_10__alien_force',_,_,Start), end('ben_10__alien_force',_,_,End), Start=<End.

generate_facts_el_chavo_animado_AND_ben_10__alien_force([]) :- assert(el_chavo_animado_AND_ben_10__alien_force(-1,-1)).

generate_facts_el_chavo_animado_AND_ben_10__alien_force([(Start,End) | Tail]) :- assert(el_chavo_animado_AND_ben_10__alien_force(Start,End)), generate_facts_el_chavo_animado_AND_ben_10__alien_force(Tail).

el_chavo_animado_AND_ben_10__alien_force_aux() :- findall((Start,End),el_chavo_animado(Start,End),Interval1), findall((Start,End),ben_10__alien_force(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_el_chavo_animado_AND_ben_10__alien_force(Interval).

el_chavo_animado_AND_ben_10__alien_force_at_2056(Res) :- setof((Start,End),el_chavo_animado_AND_ben_10__alien_force(Start,End),AllINtervals), checkvalidity(2056,AllINtervals,Res).

check_query() :- write('Query = el_chavo_animado_AND_ben_10__alien_force_at_2056'), (el_chavo_animado_AND_ben_10__alien_force_at_2056(true) -> write('\nRes   = true');write('\nRes   = false')).
?- el_chavo_animado_AND_ben_10__alien_force_aux().

