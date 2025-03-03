:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

californication_last_till_2_3(Start,End) :- californication(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

californication_until_sherlock_during_2_3_overlap(Start,End) :- californication_last_till_2_3(Start1,End1), sherlock(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

californication_until_sherlock_during_2_3(Start,End) :- californication(W1,_), californication_until_sherlock_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

californication_until_sherlock_during_2_3_at_1979(Res) :- setof((Start,End),californication_until_sherlock_during_2_3(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = californication_until_sherlock_during_2_3_at_1979'), (californication_until_sherlock_during_2_3_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

