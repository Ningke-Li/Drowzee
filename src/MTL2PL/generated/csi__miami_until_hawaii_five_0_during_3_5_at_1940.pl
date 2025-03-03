:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

csi__miami_last_till_3_5(Start,End) :- csi__miami(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

csi__miami_until_hawaii_five_0_during_3_5_overlap(Start,End) :- csi__miami_last_till_3_5(Start1,End1), hawaii_five_0(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__miami_until_hawaii_five_0_during_3_5(Start,End) :- csi__miami(W1,_), csi__miami_until_hawaii_five_0_during_3_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-3), Start=<End.

csi__miami_until_hawaii_five_0_during_3_5_at_1940(Res) :- setof((Start,End),csi__miami_until_hawaii_five_0_during_3_5(Start,End),AllINtervals), checkvalidity(1940,AllINtervals,Res).

check_query() :- write('Query = csi__miami_until_hawaii_five_0_during_3_5_at_1940'), (csi__miami_until_hawaii_five_0_during_3_5_at_1940(true) -> write('\nRes   = true');write('\nRes   = false')).

