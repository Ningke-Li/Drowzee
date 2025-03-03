:- include('database.pl').
csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

csi__ny_last_till_1_10(Start,End) :- csi__ny(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

csi__ny_until_elementary_during_1_10_overlap(Start,End) :- csi__ny_last_till_1_10(Start1,End1), elementary(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__ny_until_elementary_during_1_10(Start,End) :- csi__ny(W1,_), csi__ny_until_elementary_during_1_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-1), Start=<End.

csi__ny_until_elementary_during_1_10_at_1971(Res) :- setof((Start,End),csi__ny_until_elementary_during_1_10(Start,End),AllINtervals), checkvalidity(1971,AllINtervals,Res).

check_query() :- write('Query = csi__ny_until_elementary_during_1_10_at_1971'), (csi__ny_until_elementary_during_1_10_at_1971(true) -> write('\nRes   = true');write('\nRes   = false')).

