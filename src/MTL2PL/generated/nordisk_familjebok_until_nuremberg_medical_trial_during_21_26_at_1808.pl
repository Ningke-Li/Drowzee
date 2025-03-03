:- include('database.pl').
nordisk_familjebok(Start,End) :- begin('nordisk_familjebok',_,_,Start), end('nordisk_familjebok',_,_,End), Start=<End.

nuremberg_medical_trial(Start,End) :- begin('nuremberg_medical_trial',_,_,Start), end('nuremberg_medical_trial',_,_,End), Start=<End.

nordisk_familjebok_last_till_21_26(Start,End) :- nordisk_familjebok(Start1,End1), (End1-Start1)>=21, Start is (Start1+21), End is (End1+1).

nordisk_familjebok_until_nuremberg_medical_trial_during_21_26_overlap(Start,End) :- nordisk_familjebok_last_till_21_26(Start1,End1), nuremberg_medical_trial(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

nordisk_familjebok_until_nuremberg_medical_trial_during_21_26(Start,End) :- nordisk_familjebok(W1,_), nordisk_familjebok_until_nuremberg_medical_trial_during_21_26_overlap(Start1,End1), Start is max((Start1-26),W1), End is (End1-21), Start=<End.

nordisk_familjebok_until_nuremberg_medical_trial_during_21_26_at_1808(Res) :- setof((Start,End),nordisk_familjebok_until_nuremberg_medical_trial_during_21_26(Start,End),AllINtervals), checkvalidity(1808,AllINtervals,Res).

check_query() :- write('Query = nordisk_familjebok_until_nuremberg_medical_trial_during_21_26_at_1808'), (nordisk_familjebok_until_nuremberg_medical_trial_during_21_26_at_1808(true) -> write('\nRes   = true');write('\nRes   = false')).

