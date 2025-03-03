:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

generate_facts_csi__crime_scene_investigation_AND_peseta([]) :- assert(csi__crime_scene_investigation_AND_peseta(-1,-1)).

generate_facts_csi__crime_scene_investigation_AND_peseta([(Start,End) | Tail]) :- assert(csi__crime_scene_investigation_AND_peseta(Start,End)), generate_facts_csi__crime_scene_investigation_AND_peseta(Tail).

csi__crime_scene_investigation_AND_peseta_aux() :- findall((Start,End),csi__crime_scene_investigation(Start,End),Interval1), findall((Start,End),peseta(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_csi__crime_scene_investigation_AND_peseta(Interval).

csi__crime_scene_investigation_AND_peseta_at_2015(Res) :- setof((Start,End),csi__crime_scene_investigation_AND_peseta(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = csi__crime_scene_investigation_AND_peseta_at_2015'), (csi__crime_scene_investigation_AND_peseta_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- csi__crime_scene_investigation_AND_peseta_aux().

