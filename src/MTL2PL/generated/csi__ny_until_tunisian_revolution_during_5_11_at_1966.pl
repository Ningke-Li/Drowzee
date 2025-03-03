:- include('database.pl').
csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

tunisian_revolution(Start,End) :- begin('tunisian_revolution',_,_,Start), end('tunisian_revolution',_,_,End), Start=<End.

csi__ny_last_till_5_11(Start,End) :- csi__ny(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

csi__ny_until_tunisian_revolution_during_5_11_overlap(Start,End) :- csi__ny_last_till_5_11(Start1,End1), tunisian_revolution(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__ny_until_tunisian_revolution_during_5_11(Start,End) :- csi__ny(W1,_), csi__ny_until_tunisian_revolution_during_5_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-5), Start=<End.

csi__ny_until_tunisian_revolution_during_5_11_at_1966(Res) :- setof((Start,End),csi__ny_until_tunisian_revolution_during_5_11(Start,End),AllINtervals), checkvalidity(1966,AllINtervals,Res).

check_query() :- write('Query = csi__ny_until_tunisian_revolution_during_5_11_at_1966'), (csi__ny_until_tunisian_revolution_during_5_11_at_1966(true) -> write('\nRes   = true');write('\nRes   = false')).

