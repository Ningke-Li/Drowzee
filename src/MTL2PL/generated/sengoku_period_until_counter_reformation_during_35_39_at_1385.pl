:- include('database.pl').
sengoku_period(Start,End) :- begin('sengoku_period',_,_,Start), end('sengoku_period',_,_,End), Start=<End.

counter_reformation(Start,End) :- begin('counter_reformation',_,_,Start), end('counter_reformation',_,_,End), Start=<End.

sengoku_period_last_till_35_39(Start,End) :- sengoku_period(Start1,End1), (End1-Start1)>=35, Start is (Start1+35), End is (End1+1).

sengoku_period_until_counter_reformation_during_35_39_overlap(Start,End) :- sengoku_period_last_till_35_39(Start1,End1), counter_reformation(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sengoku_period_until_counter_reformation_during_35_39(Start,End) :- sengoku_period(W1,_), sengoku_period_until_counter_reformation_during_35_39_overlap(Start1,End1), Start is max((Start1-39),W1), End is (End1-35), Start=<End.

sengoku_period_until_counter_reformation_during_35_39_at_1385(Res) :- setof((Start,End),sengoku_period_until_counter_reformation_during_35_39(Start,End),AllINtervals), checkvalidity(1385,AllINtervals,Res).

check_query() :- write('Query = sengoku_period_until_counter_reformation_during_35_39_at_1385'), (sengoku_period_until_counter_reformation_during_35_39_at_1385(true) -> write('\nRes   = true');write('\nRes   = false')).

