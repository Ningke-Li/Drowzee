:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

psych_last_till_3_12(Start,End) :- psych(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

psych_until_homeland_during_3_12_overlap(Start,End) :- psych_last_till_3_12(Start1,End1), homeland(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

psych_until_homeland_during_3_12(Start,End) :- psych(W1,_), psych_until_homeland_during_3_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-3), Start=<End.

psych_until_homeland_during_3_12_at_2011(Res) :- setof((Start,End),psych_until_homeland_during_3_12(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = psych_until_homeland_during_3_12_at_2011'), (psych_until_homeland_during_3_12_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

