:- include('database.pl').
province_of_finland(Start,End) :- begin('province_of_finland',_,_,Start), end('province_of_finland',_,_,End), Start=<End.

gallipoli_campaign(Start,End) :- begin('gallipoli_campaign',_,_,Start), end('gallipoli_campaign',_,_,End), Start=<End.

province_of_finland_last_till_272_276(Start,End) :- province_of_finland(Start1,End1), (End1-Start1)>=272, Start is (Start1+272), End is (End1+1).

province_of_finland_until_gallipoli_campaign_during_272_276_overlap(Start,End) :- province_of_finland_last_till_272_276(Start1,End1), gallipoli_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

province_of_finland_until_gallipoli_campaign_during_272_276(Start,End) :- province_of_finland(W1,_), province_of_finland_until_gallipoli_campaign_during_272_276_overlap(Start1,End1), Start is max((Start1-276),W1), End is (End1-272), Start=<End.

province_of_finland_until_gallipoli_campaign_during_272_276_at_1552(Res) :- setof((Start,End),province_of_finland_until_gallipoli_campaign_during_272_276(Start,End),AllINtervals), checkvalidity(1552,AllINtervals,Res).

check_query() :- write('Query = province_of_finland_until_gallipoli_campaign_during_272_276_at_1552'), (province_of_finland_until_gallipoli_campaign_during_272_276_at_1552(true) -> write('\nRes   = true');write('\nRes   = false')).

