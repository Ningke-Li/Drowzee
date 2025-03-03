:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

finally_csi__crime_scene_investigation_during_8_20(Start,End) :- csi__crime_scene_investigation(Start1,End1), (Start1-20)=<(End1-8), Start is (Start1-20), End is (End1-8), Start=<End.

globally_finally_csi__crime_scene_investigation_during_8_20_during_10_25(Start,End) :- finally_csi__crime_scene_investigation_during_8_20(Start1,End1), Start is (Start1-10), End is (End1-25), Start=<End.

globally_finally_csi__crime_scene_investigation_during_8_20_during_10_25_at_1980(Res) :- setof((Start,End),globally_finally_csi__crime_scene_investigation_during_8_20_during_10_25(Start,End),AllINtervals), checkvalidity(1980,AllINtervals,Res).

check_query() :- write('Query = globally_finally_csi__crime_scene_investigation_during_8_20_during_10_25_at_1980'), (globally_finally_csi__crime_scene_investigation_during_8_20_during_10_25_at_1980(true) -> write('\nRes   = true');write('\nRes   = false')).

