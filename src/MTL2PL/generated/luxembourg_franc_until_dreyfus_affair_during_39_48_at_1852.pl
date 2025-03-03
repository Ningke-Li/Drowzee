:- include('database.pl').
luxembourg_franc(Start,End) :- begin('luxembourg_franc',_,_,Start), end('luxembourg_franc',_,_,End), Start=<End.

dreyfus_affair(Start,End) :- begin('dreyfus_affair',_,_,Start), end('dreyfus_affair',_,_,End), Start=<End.

luxembourg_franc_last_till_39_48(Start,End) :- luxembourg_franc(Start1,End1), (End1-Start1)>=39, Start is (Start1+39), End is (End1+1).

luxembourg_franc_until_dreyfus_affair_during_39_48_overlap(Start,End) :- luxembourg_franc_last_till_39_48(Start1,End1), dreyfus_affair(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

luxembourg_franc_until_dreyfus_affair_during_39_48(Start,End) :- luxembourg_franc(W1,_), luxembourg_franc_until_dreyfus_affair_during_39_48_overlap(Start1,End1), Start is max((Start1-48),W1), End is (End1-39), Start=<End.

luxembourg_franc_until_dreyfus_affair_during_39_48_at_1852(Res) :- setof((Start,End),luxembourg_franc_until_dreyfus_affair_during_39_48(Start,End),AllINtervals), checkvalidity(1852,AllINtervals,Res).

check_query() :- write('Query = luxembourg_franc_until_dreyfus_affair_during_39_48_at_1852'), (luxembourg_franc_until_dreyfus_affair_during_39_48_at_1852(true) -> write('\nRes   = true');write('\nRes   = false')).

