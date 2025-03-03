:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

girl_meets_world(Start,End) :- begin('girl_meets_world',_,_,Start), end('girl_meets_world',_,_,End), Start=<End.

csi__crime_scene_investigation_last_till_8_15(Start,End) :- csi__crime_scene_investigation(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

csi__crime_scene_investigation_until_girl_meets_world_during_8_15_overlap(Start,End) :- csi__crime_scene_investigation_last_till_8_15(Start1,End1), girl_meets_world(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__crime_scene_investigation_until_girl_meets_world_during_8_15(Start,End) :- csi__crime_scene_investigation(W1,_), csi__crime_scene_investigation_until_girl_meets_world_during_8_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-8), Start=<End.

csi__crime_scene_investigation_until_girl_meets_world_during_8_15_at_2006(Res) :- setof((Start,End),csi__crime_scene_investigation_until_girl_meets_world_during_8_15(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = csi__crime_scene_investigation_until_girl_meets_world_during_8_15_at_2006'), (csi__crime_scene_investigation_until_girl_meets_world_during_8_15_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

