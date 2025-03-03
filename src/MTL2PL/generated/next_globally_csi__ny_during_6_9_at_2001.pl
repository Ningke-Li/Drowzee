:- include('database.pl').
csi__ny(Start,End) :- begin('csi__ny',_,_,Start), end('csi__ny',_,_,End), Start=<End.

globally_csi__ny_during_6_9(Start,End) :- csi__ny(Start1,End1), Start is (Start1-6), End is (End1-9), Start=<End.

next_globally_csi__ny_during_6_9(Start,End) :- globally_csi__ny_during_6_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_csi__ny_during_6_9_at_2001(Res) :- setof((Start,End),next_globally_csi__ny_during_6_9(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = next_globally_csi__ny_during_6_9_at_2001'), (next_globally_csi__ny_during_6_9_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

