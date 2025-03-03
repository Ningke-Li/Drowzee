:- include('database.pl').
chuck(Start,End) :- begin('chuck',_,_,Start), end('chuck',_,_,End), Start=<End.

sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

chuck_last_till_1_7(Start,End) :- chuck(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

chuck_until_sherlock_during_1_7_overlap(Start,End) :- chuck_last_till_1_7(Start1,End1), sherlock(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

chuck_until_sherlock_during_1_7(Start,End) :- chuck(W1,_), chuck_until_sherlock_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

chuck_until_sherlock_during_1_7_at_1881(Res) :- setof((Start,End),chuck_until_sherlock_during_1_7(Start,End),AllINtervals), checkvalidity(1881,AllINtervals,Res).

check_query() :- write('Query = chuck_until_sherlock_during_1_7_at_1881'), (chuck_until_sherlock_during_1_7_at_1881(true) -> write('\nRes   = true');write('\nRes   = false')).

