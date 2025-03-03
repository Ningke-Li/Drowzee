:- include('database.pl').
csi__crime_scene_investigation(Start,End) :- begin('csi__crime_scene_investigation',_,_,Start), end('csi__crime_scene_investigation',_,_,End), Start=<End.

ev_2010_11_uefa_champions_league(Start,End) :- begin('ev_2010_11_uefa_champions_league',_,_,Start), end('ev_2010_11_uefa_champions_league',_,_,End), Start=<End.

csi__crime_scene_investigation_last_till_5_12(Start,End) :- csi__crime_scene_investigation(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

csi__crime_scene_investigation_until_ev_2010_11_uefa_champions_league_during_5_12_overlap(Start,End) :- csi__crime_scene_investigation_last_till_5_12(Start1,End1), ev_2010_11_uefa_champions_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__crime_scene_investigation_until_ev_2010_11_uefa_champions_league_during_5_12(Start,End) :- csi__crime_scene_investigation(W1,_), csi__crime_scene_investigation_until_ev_2010_11_uefa_champions_league_during_5_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-5), Start=<End.

csi__crime_scene_investigation_until_ev_2010_11_uefa_champions_league_during_5_12_at_1986(Res) :- setof((Start,End),csi__crime_scene_investigation_until_ev_2010_11_uefa_champions_league_during_5_12(Start,End),AllINtervals), checkvalidity(1986,AllINtervals,Res).

check_query() :- write('Query = csi__crime_scene_investigation_until_ev_2010_11_uefa_champions_league_during_5_12_at_1986'), (csi__crime_scene_investigation_until_ev_2010_11_uefa_champions_league_during_5_12_at_1986(true) -> write('\nRes   = true');write('\nRes   = false')).

