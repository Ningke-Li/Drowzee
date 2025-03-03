:- include('database.pl').
mi_coraz_n_es_tuyo(Start,End) :- begin('mi_coraz_n_es_tuyo',_,_,Start), end('mi_coraz_n_es_tuyo',_,_,End), Start=<End.

westworld(Start,End) :- begin('westworld',_,_,Start), end('westworld',_,_,End), Start=<End.

generate_facts_mi_coraz_n_es_tuyo_OR_westworld([]) :- assert(mi_coraz_n_es_tuyo_OR_westworld(-1,-1)).

generate_facts_mi_coraz_n_es_tuyo_OR_westworld([(Start,End) | Tail]) :- assert(mi_coraz_n_es_tuyo_OR_westworld(Start,End)), generate_facts_mi_coraz_n_es_tuyo_OR_westworld(Tail).

mi_coraz_n_es_tuyo_OR_westworld_aux() :- findall((Start,End),mi_coraz_n_es_tuyo(Start,End),Interval1), findall((Start,End),westworld(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_mi_coraz_n_es_tuyo_OR_westworld(Interval).

mi_coraz_n_es_tuyo_OR_westworld_at_2020(Res) :- setof((Start,End),mi_coraz_n_es_tuyo_OR_westworld(Start,End),AllINtervals), checkvalidity(2020,AllINtervals,Res).

check_query() :- write('Query = mi_coraz_n_es_tuyo_OR_westworld_at_2020'), (mi_coraz_n_es_tuyo_OR_westworld_at_2020(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mi_coraz_n_es_tuyo_OR_westworld_aux().

