:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

finally_greek_government_debt_crisis_during_5_11(Start,End) :- greek_government_debt_crisis(Start1,End1), (Start1-11)=<(End1-5), Start is (Start1-11), End is (End1-5), Start=<End.

next_finally_greek_government_debt_crisis_during_5_11(Start,End) :- finally_greek_government_debt_crisis_during_5_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_greek_government_debt_crisis_during_5_11_at_1875(Res) :- setof((Start,End),next_finally_greek_government_debt_crisis_during_5_11(Start,End),AllINtervals), checkvalidity(1875,AllINtervals,Res).

check_query() :- write('Query = next_finally_greek_government_debt_crisis_during_5_11_at_1875'), (next_finally_greek_government_debt_crisis_during_5_11_at_1875(true) -> write('\nRes   = true');write('\nRes   = false')).

