:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

psych_last_till_2_9(Start,End) :- psych(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

psych_until_greek_government_debt_crisis_during_2_9_overlap(Start,End) :- psych_last_till_2_9(Start1,End1), greek_government_debt_crisis(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

psych_until_greek_government_debt_crisis_during_2_9(Start,End) :- psych(W1,_), psych_until_greek_government_debt_crisis_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

psych_until_greek_government_debt_crisis_during_2_9_at_2049(Res) :- setof((Start,End),psych_until_greek_government_debt_crisis_during_2_9(Start,End),AllINtervals), checkvalidity(2049,AllINtervals,Res).

check_query() :- write('Query = psych_until_greek_government_debt_crisis_during_2_9_at_2049'), (psych_until_greek_government_debt_crisis_during_2_9_at_2049(true) -> write('\nRes   = true');write('\nRes   = false')).

