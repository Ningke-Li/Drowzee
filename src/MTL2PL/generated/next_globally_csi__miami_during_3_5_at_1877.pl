:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

globally_csi__miami_during_3_5(Start,End) :- csi__miami(Start1,End1), Start is (Start1-3), End is (End1-5), Start=<End.

next_globally_csi__miami_during_3_5(Start,End) :- globally_csi__miami_during_3_5(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_csi__miami_during_3_5_at_1877(Res) :- setof((Start,End),next_globally_csi__miami_during_3_5(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = next_globally_csi__miami_during_3_5_at_1877'), (next_globally_csi__miami_during_3_5_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).

