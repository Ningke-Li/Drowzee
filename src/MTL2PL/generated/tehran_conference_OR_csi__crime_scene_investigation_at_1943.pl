:- include('database.pl').
tehran_conference(Start,End) :- begin('tehran_conference',_,_,Start), end('tehran_conference',_,_,End), Start=<End.

csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

generate_facts_tehran_conference_OR_csi__crime_scene_investigation([]) :- assert(tehran_conference_OR_csi__crime_scene_investigation(-1,-1)).

generate_facts_tehran_conference_OR_csi__crime_scene_investigation([(Start,End) | Tail]) :- assert(tehran_conference_OR_csi__crime_scene_investigation(Start,End)), generate_facts_tehran_conference_OR_csi__crime_scene_investigation(Tail).

tehran_conference_OR_csi__crime_scene_investigation_aux() :- findall((Start,End),tehran_conference(Start,End),Interval1), findall((Start,End),csi__crime_scene_investigation(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_tehran_conference_OR_csi__crime_scene_investigation(Interval).

tehran_conference_OR_csi__crime_scene_investigation_at_1943(Res) :- setof((Start,End),tehran_conference_OR_csi__crime_scene_investigation(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = tehran_conference_OR_csi__crime_scene_investigation_at_1943'), (tehran_conference_OR_csi__crime_scene_investigation_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- tehran_conference_OR_csi__crime_scene_investigation_aux().

