:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

globally_csi__crime_scene_investigation_during_2_3(Start,End) :- csi__crime_scene_investigation(Start1,End1), Start is (Start1-2), End is (End1-3), Start=<End.

globally_csi__crime_scene_investigation_during_2_3_at_2010(Res) :- setof((Start,End),globally_csi__crime_scene_investigation_during_2_3(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = globally_csi__crime_scene_investigation_during_2_3_at_2010'), (globally_csi__crime_scene_investigation_during_2_3_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

