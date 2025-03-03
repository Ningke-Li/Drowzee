:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

hawaii_five_0(Start,End) :- begin('hawaii_five_0',_,_,Start), end('hawaii_five_0',_,_,End), Start=<End.

psych_last_till_1_9(Start,End) :- psych(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

psych_until_hawaii_five_0_during_1_9_overlap(Start,End) :- psych_last_till_1_9(Start1,End1), hawaii_five_0(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

psych_until_hawaii_five_0_during_1_9(Start,End) :- psych(W1,_), psych_until_hawaii_five_0_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

psych_until_hawaii_five_0_during_1_9_at_1950(Res) :- setof((Start,End),psych_until_hawaii_five_0_during_1_9(Start,End),AllINtervals), checkvalidity(1950,AllINtervals,Res).

check_query() :- write('Query = psych_until_hawaii_five_0_during_1_9_at_1950'), (psych_until_hawaii_five_0_during_1_9_at_1950(true) -> write('\nRes   = true');write('\nRes   = false')).

