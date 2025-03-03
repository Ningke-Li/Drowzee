:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

globally_csi__miami_during_1_8(Start,End) :- csi__miami(Start1,End1), Start is (Start1-1), End is (End1-8), Start=<End.

globally_csi__miami_during_1_8_at_2002(Res) :- setof((Start,End),globally_csi__miami_during_1_8(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = globally_csi__miami_during_1_8_at_2002'), (globally_csi__miami_during_1_8_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

