:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

globally_csi__miami_during_7_9(Start,End) :- csi__miami(Start1,End1), Start is (Start1-7), End is (End1-9), Start=<End.

next_globally_csi__miami_during_7_9(Start,End) :- globally_csi__miami_during_7_9(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_csi__miami_during_7_9_at_2006(Res) :- setof((Start,End),next_globally_csi__miami_during_7_9(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = next_globally_csi__miami_during_7_9_at_2006'), (next_globally_csi__miami_during_7_9_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

