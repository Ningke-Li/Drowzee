:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

mexican_american_war(Start,End) :- begin('mexican_american_war',_,_,Start), end('mexican_american_war',_,_,End), Start=<End.

province_of_finland_last_till_102_112(Start,End) :- province_of_finland(Start1,End1), (End1-Start1)>=102, Start is (Start1+102), End is (End1+1).

province_of_finland_until_mexican_american_war_during_102_112_overlap(Start,End) :- province_of_finland_last_till_102_112(Start1,End1), mexican_american_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

province_of_finland_until_mexican_american_war_during_102_112(Start,End) :- province_of_finland(W1,_), province_of_finland_until_mexican_american_war_during_102_112_overlap(Start1,End1), Start is max((Start1-112),W1), End is (End1-102), Start=<End.

province_of_finland_until_mexican_american_war_during_102_112_at_1742(Res) :- setof((Start,End),province_of_finland_until_mexican_american_war_during_102_112(Start,End),AllINtervals), checkvalidity(1742,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_until_mexican_american_war_during_102_112_at_1742'), (province_of_finland_until_mexican_american_war_during_102_112_at_1742(true) -> write('\nRes   = true');write('\nRes   = false')).

