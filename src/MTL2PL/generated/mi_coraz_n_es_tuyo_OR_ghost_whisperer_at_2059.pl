:- include('database.pl').
mi_coraz_n_es_tuyo(Start,End) :- begin('mi_coraz_n_es_tuyo',_,_,Start), end('mi_coraz_n_es_tuyo',_,_,End), Start=<End.

ghost_whisperer(Start,End) :- begin('ghost_whisperer',_,_,Start), end('ghost_whisperer',_,_,End), Start=<End.

generate_facts_mi_coraz_n_es_tuyo_OR_ghost_whisperer([]) :- assert(mi_coraz_n_es_tuyo_OR_ghost_whisperer(-1,-1)).

generate_facts_mi_coraz_n_es_tuyo_OR_ghost_whisperer([(Start,End) | Tail]) :- assert(mi_coraz_n_es_tuyo_OR_ghost_whisperer(Start,End)), generate_facts_mi_coraz_n_es_tuyo_OR_ghost_whisperer(Tail).

mi_coraz_n_es_tuyo_OR_ghost_whisperer_aux() :- findall((Start,End),mi_coraz_n_es_tuyo(Start,End),Interval1), findall((Start,End),ghost_whisperer(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mi_coraz_n_es_tuyo_OR_ghost_whisperer(Interval).

mi_coraz_n_es_tuyo_OR_ghost_whisperer_at_2059(Res) :- setof((Start,End),mi_coraz_n_es_tuyo_OR_ghost_whisperer(Start,End),AllINtervals), checkvalidity(2059,AllINtervals,Res).

check_query() :- write('Query = mi_coraz_n_es_tuyo_OR_ghost_whisperer_at_2059'), (mi_coraz_n_es_tuyo_OR_ghost_whisperer_at_2059(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mi_coraz_n_es_tuyo_OR_ghost_whisperer_aux().

