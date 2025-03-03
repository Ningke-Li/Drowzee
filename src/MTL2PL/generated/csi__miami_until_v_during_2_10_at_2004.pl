:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

v(Start,End) :- begin('v',_,_,Start), end('v',_,_,End), Start=<End.

csi__miami_last_till_2_10(Start,End) :- csi__miami(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

csi__miami_until_v_during_2_10_overlap(Start,End) :- csi__miami_last_till_2_10(Start1,End1), v(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__miami_until_v_during_2_10(Start,End) :- csi__miami(W1,_), csi__miami_until_v_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

csi__miami_until_v_during_2_10_at_2004(Res) :- setof((Start,End),csi__miami_until_v_during_2_10(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = csi__miami_until_v_during_2_10_at_2004'), (csi__miami_until_v_during_2_10_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

