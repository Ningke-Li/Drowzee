:- include('database.pl').
csi__miami(Start,End) :- begin('csi__miami',_,_,Start), end('csi__miami',_,_,End), Start=<End.

keeping_up_with_the_kardashians(Start,End) :- begin('keeping_up_with_the_kardashians',_,_,Start), end('keeping_up_with_the_kardashians',_,_,End), Start=<End.

csi__miami_last_till_3_12(Start,End) :- csi__miami(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

csi__miami_until_keeping_up_with_the_kardashians_during_3_12_overlap(Start,End) :- csi__miami_last_till_3_12(Start1,End1), keeping_up_with_the_kardashians(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

csi__miami_until_keeping_up_with_the_kardashians_during_3_12(Start,End) :- csi__miami(W1,_), csi__miami_until_keeping_up_with_the_kardashians_during_3_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-3), Start=<End.

csi__miami_until_keeping_up_with_the_kardashians_during_3_12_at_1906(Res) :- setof((Start,End),csi__miami_until_keeping_up_with_the_kardashians_during_3_12(Start,End),AllINtervals), checkvalidity(1906,AllINtervals,Res).

check_query() :- write('Query = csi__miami_until_keeping_up_with_the_kardashians_during_3_12_at_1906'), (csi__miami_until_keeping_up_with_the_kardashians_during_3_12_at_1906(true) -> write('\nRes   = true');write('\nRes   = false')).

