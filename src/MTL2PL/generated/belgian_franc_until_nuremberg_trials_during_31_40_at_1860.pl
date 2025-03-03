:- include('database.pl').
belgian_franc(Start,End) :- begin('belgian_franc',_,_,Start), end('belgian_franc',_,_,End), Start=<End.

nuremberg_trials(Start,End) :- begin('nuremberg_trials',_,_,Start), end('nuremberg_trials',_,_,End), Start=<End.

belgian_franc_last_till_31_40(Start,End) :- belgian_franc(Start1,End1), (End1-Start1)>=31, Start is (Start1+31), End is (End1+1).

belgian_franc_until_nuremberg_trials_during_31_40_overlap(Start,End) :- belgian_franc_last_till_31_40(Start1,End1), nuremberg_trials(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

belgian_franc_until_nuremberg_trials_during_31_40(Start,End) :- belgian_franc(W1,_), belgian_franc_until_nuremberg_trials_during_31_40_overlap(Start1,End1), Start is max((Start1-40),W1), End is (End1-31), Start=<End.

belgian_franc_until_nuremberg_trials_during_31_40_at_1860(Res) :- setof((Start,End),belgian_franc_until_nuremberg_trials_during_31_40(Start,End),AllINtervals), checkvalidity(1860,AllINtervals,Res).

check_query() :- write('Query = belgian_franc_until_nuremberg_trials_during_31_40_at_1860'), (belgian_franc_until_nuremberg_trials_during_31_40_at_1860(true) -> write('\nRes   = true');write('\nRes   = false')).

