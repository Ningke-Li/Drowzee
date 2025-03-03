:- include('database.pl').
csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

finally_csi__ny_during_5_19(Start,End) :- csi__ny(Start1,End1), (Start1-19)=<(End1-5), Start is (Start1-19), End is (End1-5), Start=<End.

globally_finally_csi__ny_during_5_19_during_16_20(Start,End) :- finally_csi__ny_during_5_19(Start1,End1), Start is (Start1-16), End is (End1-20), Start=<End.

globally_finally_csi__ny_during_5_19_during_16_20_at_1979(Res) :- setof((Start,End),globally_finally_csi__ny_during_5_19_during_16_20(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = globally_finally_csi__ny_during_5_19_during_16_20_at_1979'), (globally_finally_csi__ny_during_5_19_during_16_20_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

