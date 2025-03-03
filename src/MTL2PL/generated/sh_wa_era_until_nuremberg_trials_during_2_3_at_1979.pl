:- include('database.pl').
sh_wa_era(Start,End) :- begin('sh_wa_era',_,_,Start), end('sh_wa_era',_,_,End), Start=<End.

nuremberg_trials(Start,End) :- begin('nuremberg_trials',_,_,Start), end('nuremberg_trials',_,_,End), Start=<End.

sh_wa_era_last_till_2_3(Start,End) :- sh_wa_era(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

sh_wa_era_until_nuremberg_trials_during_2_3_overlap(Start,End) :- sh_wa_era_last_till_2_3(Start1,End1), nuremberg_trials(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

sh_wa_era_until_nuremberg_trials_during_2_3(Start,End) :- sh_wa_era(W1,_), sh_wa_era_until_nuremberg_trials_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

sh_wa_era_until_nuremberg_trials_during_2_3_at_1979(Res) :- setof((Start,End),sh_wa_era_until_nuremberg_trials_during_2_3(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = sh_wa_era_until_nuremberg_trials_during_2_3_at_1979'), (sh_wa_era_until_nuremberg_trials_during_2_3_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

