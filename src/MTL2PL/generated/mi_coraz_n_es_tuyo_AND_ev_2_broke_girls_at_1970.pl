:- include('database.pl').
mi_coraz_n_es_tuyo(Start,End) :- begin('mi_coraz_n_es_tuyo',_,_,Start), end('mi_coraz_n_es_tuyo',_,_,End), Start=<End.

ev_2_broke_girls(Start,End) :- begin('ev_2_broke_girls',_,_,Start), end('ev_2_broke_girls',_,_,End), Start=<End.

generate_facts_mi_coraz_n_es_tuyo_AND_ev_2_broke_girls([]) :- assert(mi_coraz_n_es_tuyo_AND_ev_2_broke_girls(-1,-1)).

generate_facts_mi_coraz_n_es_tuyo_AND_ev_2_broke_girls([(Start,End) | Tail]) :- assert(mi_coraz_n_es_tuyo_AND_ev_2_broke_girls(Start,End)), generate_facts_mi_coraz_n_es_tuyo_AND_ev_2_broke_girls(Tail).

mi_coraz_n_es_tuyo_AND_ev_2_broke_girls_aux() :- findall((Start,End),mi_coraz_n_es_tuyo(Start,End),Interval1), findall((Start,End),ev_2_broke_girls(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_mi_coraz_n_es_tuyo_AND_ev_2_broke_girls(Interval).

mi_coraz_n_es_tuyo_AND_ev_2_broke_girls_at_1970(Res) :- setof((Start,End),mi_coraz_n_es_tuyo_AND_ev_2_broke_girls(Start,End),AllINtervals), checkvalidity(1970,AllINtervals,Res).

check_query() :- write('Query = mi_coraz_n_es_tuyo_AND_ev_2_broke_girls_at_1970'), (mi_coraz_n_es_tuyo_AND_ev_2_broke_girls_at_1970(true) -> write('\nRes   = true');write('\nRes   = false')).
?- mi_coraz_n_es_tuyo_AND_ev_2_broke_girls_aux().

