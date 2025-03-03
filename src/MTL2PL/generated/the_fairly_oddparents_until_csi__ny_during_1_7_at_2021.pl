:- include('database.pl').
the_fairly_oddparents(Start,End) :- begin('the_fairly_oddparents',_,_,Start), end('the_fairly_oddparents',_,_,End), Start=<End.

csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

the_fairly_oddparents_last_till_1_7(Start,End) :- the_fairly_oddparents(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

the_fairly_oddparents_until_csi__ny_during_1_7_overlap(Start,End) :- the_fairly_oddparents_last_till_1_7(Start1,End1), csi__ny(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_fairly_oddparents_until_csi__ny_during_1_7(Start,End) :- the_fairly_oddparents(W1,_), the_fairly_oddparents_until_csi__ny_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

the_fairly_oddparents_until_csi__ny_during_1_7_at_2021(Res) :- setof((Start,End),the_fairly_oddparents_until_csi__ny_during_1_7(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = the_fairly_oddparents_until_csi__ny_during_1_7_at_2021'), (the_fairly_oddparents_until_csi__ny_during_1_7_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).

