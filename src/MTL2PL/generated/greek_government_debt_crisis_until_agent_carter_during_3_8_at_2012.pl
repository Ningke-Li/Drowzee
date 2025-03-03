:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

agent_carter(Start,End) :- begin('agent_carter',_,_,Start), end('agent_carter',_,_,End), Start=<End.

greek_government_debt_crisis_last_till_3_8(Start,End) :- greek_government_debt_crisis(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

greek_government_debt_crisis_until_agent_carter_during_3_8_overlap(Start,End) :- greek_government_debt_crisis_last_till_3_8(Start1,End1), agent_carter(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

greek_government_debt_crisis_until_agent_carter_during_3_8(Start,End) :- greek_government_debt_crisis(W1,_), greek_government_debt_crisis_until_agent_carter_during_3_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-3), Start=<End.

greek_government_debt_crisis_until_agent_carter_during_3_8_at_2012(Res) :- setof((Start,End),greek_government_debt_crisis_until_agent_carter_during_3_8(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = greek_government_debt_crisis_until_agent_carter_during_3_8_at_2012'), (greek_government_debt_crisis_until_agent_carter_during_3_8_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

