:- include('database.pl').
shimabara_rebellion(Start,End) :- begin('shimabara_rebellion',_,_,Start), end('shimabara_rebellion',_,_,End), Start=<End.

finally_shimabara_rebellion_during_7_14(Start,End) :- shimabara_rebellion(Start1,End1), (Start1-14)=<(End1-7), Start is (Start1-14), End is (End1-7), Start=<End.

finally_shimabara_rebellion_during_7_14_at_1580(Res) :- setof((Start,End),finally_shimabara_rebellion_during_7_14(Start,End),AllINtervals), checkvalidity(1580,AllINtervals,Res).

check_query() :- write('Query = finally_shimabara_rebellion_during_7_14_at_1580'), (finally_shimabara_rebellion_during_7_14_at_1580(true) -> write('\nRes   = true');write('\nRes   = false')).

