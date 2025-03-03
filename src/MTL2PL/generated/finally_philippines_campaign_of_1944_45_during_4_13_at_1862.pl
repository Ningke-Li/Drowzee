:- include('database.pl').
philippines_campaign_of_1944_45(Start,End) :- begin('philippines_campaign_of_1944_45',_,_,Start), end('philippines_campaign_of_1944_45',_,_,End), Start=<End.

finally_philippines_campaign_of_1944_45_during_4_13(Start,End) :- philippines_campaign_of_1944_45(Start1,End1), (Start1-13)=<(End1-4), Start is (Start1-13), End is (End1-4), Start=<End.

finally_philippines_campaign_of_1944_45_during_4_13_at_1862(Res) :- setof((Start,End),finally_philippines_campaign_of_1944_45_during_4_13(Start,End),AllINtervals), checkvalidity(1862,AllINtervals,Res).

check_query() :- write('Query = finally_philippines_campaign_of_1944_45_during_4_13_at_1862'), (finally_philippines_campaign_of_1944_45_during_4_13_at_1862(true) -> write('\nRes   = true');write('\nRes   = false')).

