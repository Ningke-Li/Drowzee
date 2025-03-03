:- include('database.pl').
phineas_and_ferb(Start,End) :- begin('phineas_and_ferb',_,_,Start), end('phineas_and_ferb',_,_,End), Start=<End.

once_upon_a_time(Start,End) :- begin('once_upon_a_time',_,_,Start), end('once_upon_a_time',_,_,End), Start=<End.

phineas_and_ferb_last_till_2_3(Start,End) :- phineas_and_ferb(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

phineas_and_ferb_until_once_upon_a_time_during_2_3_overlap(Start,End) :- phineas_and_ferb_last_till_2_3(Start1,End1), once_upon_a_time(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

phineas_and_ferb_until_once_upon_a_time_during_2_3(Start,End) :- phineas_and_ferb(W1,_), phineas_and_ferb_until_once_upon_a_time_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

phineas_and_ferb_until_once_upon_a_time_during_2_3_at_1977(Res) :- setof((Start,End),phineas_and_ferb_until_once_upon_a_time_during_2_3(Start,End),AllINtervals), checkvalidity(1977,AllINtervals,Res).

check_query() :- write('Query = phineas_and_ferb_until_once_upon_a_time_during_2_3_at_1977'), (phineas_and_ferb_until_once_upon_a_time_during_2_3_at_1977(true) -> write('\nRes   = true');write('\nRes   = false')).

