:- include('database.pl').
meiji_restoration(Start,End) :- begin('meiji_restoration',_,_,Start), end('meiji_restoration',_,_,End), Start=<End.

berlin_conference(Start,End) :- begin('berlin_conference',_,_,Start), end('berlin_conference',_,_,End), Start=<End.

meiji_restoration_last_till_8_11(Start,End) :- meiji_restoration(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

meiji_restoration_until_berlin_conference_during_8_11_overlap(Start,End) :- meiji_restoration_last_till_8_11(Start1,End1), berlin_conference(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

meiji_restoration_until_berlin_conference_during_8_11(Start,End) :- meiji_restoration(W1,_), meiji_restoration_until_berlin_conference_during_8_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-8), Start=<End.

meiji_restoration_until_berlin_conference_during_8_11_at_1873(Res) :- setof((Start,End),meiji_restoration_until_berlin_conference_during_8_11(Start,End),AllINtervals), checkvalidity(1873,AllINtervals,Res).

check_query() :- write('Query = meiji_restoration_until_berlin_conference_during_8_11_at_1873'), (meiji_restoration_until_berlin_conference_during_8_11_at_1873(true) -> write('\nRes   = true');write('\nRes   = false')).

