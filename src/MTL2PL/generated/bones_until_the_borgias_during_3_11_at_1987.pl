:- include('database.pl').
bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

the_borgias(Start,End) :- begin('the_borgias',_,_,Start), end('the_borgias',_,_,End), Start=<End.

bones_last_till_3_11(Start,End) :- bones(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

bones_until_the_borgias_during_3_11_overlap(Start,End) :- bones_last_till_3_11(Start1,End1), the_borgias(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

bones_until_the_borgias_during_3_11(Start,End) :- bones(W1,_), bones_until_the_borgias_during_3_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-3), Start=<End.

bones_until_the_borgias_during_3_11_at_1987(Res) :- setof((Start,End),bones_until_the_borgias_during_3_11(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = bones_until_the_borgias_during_3_11_at_1987'), (bones_until_the_borgias_during_3_11_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).

