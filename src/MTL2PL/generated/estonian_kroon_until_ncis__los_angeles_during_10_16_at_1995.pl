:- include('database.pl').
estonian_kroon(Start,End) :- begin('estonian_kroon',_,_,Start), end('estonian_kroon',_,_,End), Start=<End.

ncis__los_angeles(Start,End) :- begin('ncis__los_angeles',_,_,Start), end('ncis__los_angeles',_,_,End), Start=<End.

estonian_kroon_last_till_10_16(Start,End) :- estonian_kroon(Start1,End1), (End1-Start1)>=10, Start is (Start1+10), End is (End1+1).

estonian_kroon_until_ncis__los_angeles_during_10_16_overlap(Start,End) :- estonian_kroon_last_till_10_16(Start1,End1), ncis__los_angeles(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

estonian_kroon_until_ncis__los_angeles_during_10_16(Start,End) :- estonian_kroon(W1,_), estonian_kroon_until_ncis__los_angeles_during_10_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-10), Start=<End.

estonian_kroon_until_ncis__los_angeles_during_10_16_at_1995(Res) :- setof((Start,End),estonian_kroon_until_ncis__los_angeles_during_10_16(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = estonian_kroon_until_ncis__los_angeles_during_10_16_at_1995'), (estonian_kroon_until_ncis__los_angeles_during_10_16_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

