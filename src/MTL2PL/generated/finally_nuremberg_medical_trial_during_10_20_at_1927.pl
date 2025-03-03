:- include('database.pl').
nuremberg_medical_trial(Start,End) :- begin('nuremberg_medical_trial',_,_,Start), end('nuremberg_medical_trial',_,_,End), Start=<End.

finally_nuremberg_medical_trial_during_10_20(Start,End) :- nuremberg_medical_trial(Start1,End1), (Start1-20)=<(End1-10), Start is (Start1-20), End is (End1-10), Start=<End.

finally_nuremberg_medical_trial_during_10_20_at_1927(Res) :- setof((Start,End),finally_nuremberg_medical_trial_during_10_20(Start,End),AllINtervals), checkvalidity(1927,AllINtervals,Res).

check_query() :- write('Query = finally_nuremberg_medical_trial_during_10_20_at_1927'), (finally_nuremberg_medical_trial_during_10_20_at_1927(true) -> write('\nRes   = true');write('\nRes   = false')).

