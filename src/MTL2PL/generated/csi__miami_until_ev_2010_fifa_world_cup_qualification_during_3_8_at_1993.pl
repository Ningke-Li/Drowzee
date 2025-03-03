:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

ev_2010_fifa_world_cup_qualification(Start,End) :- begin('ev_2010_fifa_world_cup_qualification',_,_,Start), end('ev_2010_fifa_world_cup_qualification',_,_,End), Start=<End.

csi__miami_last_till_3_8(Start,End) :- csi__miami(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

csi__miami_until_ev_2010_fifa_world_cup_qualification_during_3_8_overlap(Start,End) :- csi__miami_last_till_3_8(Start1,End1), ev_2010_fifa_world_cup_qualification(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__miami_until_ev_2010_fifa_world_cup_qualification_during_3_8(Start,End) :- csi__miami(W1,_), csi__miami_until_ev_2010_fifa_world_cup_qualification_during_3_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-3), Start=<End.

csi__miami_until_ev_2010_fifa_world_cup_qualification_during_3_8_at_1993(Res) :- setof((Start,End),csi__miami_until_ev_2010_fifa_world_cup_qualification_during_3_8(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = csi__miami_until_ev_2010_fifa_world_cup_qualification_during_3_8_at_1993'), (csi__miami_until_ev_2010_fifa_world_cup_qualification_during_3_8_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

