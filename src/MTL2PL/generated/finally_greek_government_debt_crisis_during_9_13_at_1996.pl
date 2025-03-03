:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

finally_greek_government_debt_crisis_during_9_13(Start,End) :- greek_government_debt_crisis(Start1,End1), (Start1-13)=<(End1-9), Start is (Start1-13), End is (End1-9), Start=<End.

finally_greek_government_debt_crisis_during_9_13_at_1996(Res) :- setof((Start,End),finally_greek_government_debt_crisis_during_9_13(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = finally_greek_government_debt_crisis_during_9_13_at_1996'), (finally_greek_government_debt_crisis_during_9_13_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

