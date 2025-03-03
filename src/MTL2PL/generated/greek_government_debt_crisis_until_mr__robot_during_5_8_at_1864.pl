:- include('database.pl').
greek_government_debt_crisis(Start,End) :- begin('greek_government_debt_crisis',_,_,Start), end('greek_government_debt_crisis',_,_,End), Start=<End.

mr__robot(Start,End) :- begin('mr__robot',_,_,Start), end('mr__robot',_,_,End), Start=<End.

greek_government_debt_crisis_last_till_5_8(Start,End) :- greek_government_debt_crisis(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

greek_government_debt_crisis_until_mr__robot_during_5_8_overlap(Start,End) :- greek_government_debt_crisis_last_till_5_8(Start1,End1), mr__robot(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

greek_government_debt_crisis_until_mr__robot_during_5_8(Start,End) :- greek_government_debt_crisis(W1,_), greek_government_debt_crisis_until_mr__robot_during_5_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-5), Start=<End.

greek_government_debt_crisis_until_mr__robot_during_5_8_at_1864(Res) :- setof((Start,End),greek_government_debt_crisis_until_mr__robot_during_5_8(Start,End),AllINtervals), checkvalidity(1864,AllINtervals,Res).

check_query() :- write('Query = greek_government_debt_crisis_until_mr__robot_during_5_8_at_1864'), (greek_government_debt_crisis_until_mr__robot_during_5_8_at_1864(true) -> write('\nRes   = true');write('\nRes   = false')).

