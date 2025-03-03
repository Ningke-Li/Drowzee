:- include('database.pl').
revenge(Start,End) :- begin('revenge',_,_,Start), end('revenge',_,_,End), Start=<End.

the_100(Start,End) :- begin('the_100',_,_,Start), end('the_100',_,_,End), Start=<End.

revenge_last_till_1_4(Start,End) :- revenge(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

revenge_until_the_100_during_1_4_overlap(Start,End) :- revenge_last_till_1_4(Start1,End1), the_100(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

revenge_until_the_100_during_1_4(Start,End) :- revenge(W1,_), revenge_until_the_100_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

revenge_until_the_100_during_1_4_at_2014(Res) :- setof((Start,End),revenge_until_the_100_during_1_4(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = revenge_until_the_100_during_1_4_at_2014'), (revenge_until_the_100_during_1_4_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

