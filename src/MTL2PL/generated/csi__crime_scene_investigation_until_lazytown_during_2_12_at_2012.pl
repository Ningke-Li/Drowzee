:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

csi__crime_scene_investigation_last_till_2_12(Start,End) :- csi__crime_scene_investigation(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

csi__crime_scene_investigation_until_lazytown_during_2_12_overlap(Start,End) :- csi__crime_scene_investigation_last_till_2_12(Start1,End1), lazytown(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__crime_scene_investigation_until_lazytown_during_2_12(Start,End) :- csi__crime_scene_investigation(W1,_), csi__crime_scene_investigation_until_lazytown_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

csi__crime_scene_investigation_until_lazytown_during_2_12_at_2012(Res) :- setof((Start,End),csi__crime_scene_investigation_until_lazytown_during_2_12(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = csi__crime_scene_investigation_until_lazytown_during_2_12_at_2012'), (csi__crime_scene_investigation_until_lazytown_during_2_12_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

