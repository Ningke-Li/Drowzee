:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

jericho(Start,End) :- begin('jericho',_,_,Start), end('jericho',_,_,End), Start=<End.

csi__miami_last_till_3_9(Start,End) :- csi__miami(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

csi__miami_until_jericho_during_3_9_overlap(Start,End) :- csi__miami_last_till_3_9(Start1,End1), jericho(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__miami_until_jericho_during_3_9(Start,End) :- csi__miami(W1,_), csi__miami_until_jericho_during_3_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-3), Start=<End.

csi__miami_until_jericho_during_3_9_at_1984(Res) :- setof((Start,End),csi__miami_until_jericho_during_3_9(Start,End),AllINtervals), checkvalidity(1984,AllINtervals,Res).

check_query() :- write('Query = csi__miami_until_jericho_during_3_9_at_1984'), (csi__miami_until_jericho_during_3_9_at_1984(true) -> write('\nRes   = true');write('\nRes   = false')).

