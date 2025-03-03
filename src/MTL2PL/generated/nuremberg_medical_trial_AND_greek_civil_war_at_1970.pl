:- include('database.pl').
nuremberg_medical_trial(Start,End) :- begin('nuremberg_medical_trial',_,_,Start), end('nuremberg_medical_trial',_,_,End), Start=<End.

greek_civil_war(Start,End) :- begin('greek_civil_war',_,_,Start), end('greek_civil_war',_,_,End), Start=<End.

generate_facts_nuremberg_medical_trial_AND_greek_civil_war([]) :- assert(nuremberg_medical_trial_AND_greek_civil_war(-1,-1)).

generate_facts_nuremberg_medical_trial_AND_greek_civil_war([(Start,End) | Tail]) :- assert(nuremberg_medical_trial_AND_greek_civil_war(Start,End)), generate_facts_nuremberg_medical_trial_AND_greek_civil_war(Tail).

nuremberg_medical_trial_AND_greek_civil_war_aux() :- findall((Start,End),nuremberg_medical_trial(Start,End),Interval1), findall((Start,End),greek_civil_war(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_nuremberg_medical_trial_AND_greek_civil_war(Interval).

nuremberg_medical_trial_AND_greek_civil_war_at_1970(Res) :- setof((Start,End),nuremberg_medical_trial_AND_greek_civil_war(Start,End),AllINtervals), checkvalidity(1970,AllINtervals,Res).

check_query() :- write('Query = nuremberg_medical_trial_AND_greek_civil_war_at_1970'), (nuremberg_medical_trial_AND_greek_civil_war_at_1970(true) -> write('\nRes   = true');write('\nRes   = false')).
?- nuremberg_medical_trial_AND_greek_civil_war_aux().

