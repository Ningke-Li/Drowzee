:- include('database.pl').
ev_2007_08_serie_a(Start,End) :- begin('ev_2007_08_serie_a',_,_,Start), end('ev_2007_08_serie_a',_,_,End), Start=<End.

csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

generate_facts_ev_2007_08_serie_a_AND_csi__crime_scene_investigation([]) :- assert(ev_2007_08_serie_a_AND_csi__crime_scene_investigation(-1,-1)).

generate_facts_ev_2007_08_serie_a_AND_csi__crime_scene_investigation([(Start,End) | Tail]) :- assert(ev_2007_08_serie_a_AND_csi__crime_scene_investigation(Start,End)), generate_facts_ev_2007_08_serie_a_AND_csi__crime_scene_investigation(Tail).

ev_2007_08_serie_a_AND_csi__crime_scene_investigation_aux() :- findall((Start,End),ev_2007_08_serie_a(Start,End),Interval1), findall((Start,End),csi__crime_scene_investigation(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_ev_2007_08_serie_a_AND_csi__crime_scene_investigation(Interval).

ev_2007_08_serie_a_AND_csi__crime_scene_investigation_at_1875(Res) :- setof((Start,End),ev_2007_08_serie_a_AND_csi__crime_scene_investigation(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = ev_2007_08_serie_a_AND_csi__crime_scene_investigation_at_1875'), (ev_2007_08_serie_a_AND_csi__crime_scene_investigation_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).
?- ev_2007_08_serie_a_AND_csi__crime_scene_investigation_aux().

