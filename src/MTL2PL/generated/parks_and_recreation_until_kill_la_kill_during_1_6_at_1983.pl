:- include('database.pl').
parks_and_recreation(Start,End) :- begin('parks_and_recreation',_,_,Start), end('parks_and_recreation',_,_,End), Start=<End.

kill_la_kill(Start,End) :- begin('kill_la_kill',_,_,Start), end('kill_la_kill',_,_,End), Start=<End.

parks_and_recreation_last_till_1_6(Start,End) :- parks_and_recreation(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

parks_and_recreation_until_kill_la_kill_during_1_6_overlap(Start,End) :- parks_and_recreation_last_till_1_6(Start1,End1), kill_la_kill(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

parks_and_recreation_until_kill_la_kill_during_1_6(Start,End) :- parks_and_recreation(W1,_), parks_and_recreation_until_kill_la_kill_during_1_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-1), Start=<End.

parks_and_recreation_until_kill_la_kill_during_1_6_at_1983(Res) :- setof((Start,End),parks_and_recreation_until_kill_la_kill_during_1_6(Start,End),AllINtervals), checkvalidity(1983,AllINtervals,Res).

check_query() :- write('Query = parks_and_recreation_until_kill_la_kill_during_1_6_at_1983'), (parks_and_recreation_until_kill_la_kill_during_1_6_at_1983(true) -> write('\nRes   = true');write('\nRes   = false')).

