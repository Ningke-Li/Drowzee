:- include('database.pl').
lazytown(Start,End) :- begin('lazytown',_,_,Start), end('lazytown',_,_,End), Start=<End.

misfits(Start,End) :- begin('misfits',_,_,Start), end('misfits',_,_,End), Start=<End.

lazytown_last_till_1_9(Start,End) :- lazytown(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

lazytown_until_misfits_during_1_9_overlap(Start,End) :- lazytown_last_till_1_9(Start1,End1), misfits(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lazytown_until_misfits_during_1_9(Start,End) :- lazytown(W1,_), lazytown_until_misfits_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

lazytown_until_misfits_during_1_9_at_1875(Res) :- setof((Start,End),lazytown_until_misfits_during_1_9(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = lazytown_until_misfits_during_1_9_at_1875'), (lazytown_until_misfits_during_1_9_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

