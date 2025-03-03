:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

finally_csi__miami_during_1_14(Start,End) :- csi__miami(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

next_finally_csi__miami_during_1_14(Start,End) :- finally_csi__miami_during_1_14(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_csi__miami_during_1_14_at_2008(Res) :- setof((Start,End),next_finally_csi__miami_during_1_14(Start,End),AllINtervals), checkvalidity(2008,AllINtervals,Res).

check_query() :- write('Query = next_finally_csi__miami_during_1_14_at_2008'), (next_finally_csi__miami_during_1_14_at_2008(true) -> write('\nRes   = true');write('\nRes   = false')).

