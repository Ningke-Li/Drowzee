:- include('database.pl').
age_of_enlightenment(Start,End) :- begin('age_of_enlightenment',_,_,Start), end('age_of_enlightenment',_,_,End), Start=<End.

pruth_river_campaign(Start,End) :- begin('pruth_river_campaign',_,_,Start), end('pruth_river_campaign',_,_,End), Start=<End.

age_of_enlightenment_last_till_7_8(Start,End) :- age_of_enlightenment(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

age_of_enlightenment_until_pruth_river_campaign_during_7_8_overlap(Start,End) :- age_of_enlightenment_last_till_7_8(Start1,End1), pruth_river_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

age_of_enlightenment_until_pruth_river_campaign_during_7_8(Start,End) :- age_of_enlightenment(W1,_), age_of_enlightenment_until_pruth_river_campaign_during_7_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-7), Start=<End.

age_of_enlightenment_until_pruth_river_campaign_during_7_8_at_1675(Res) :- setof((Start,End),age_of_enlightenment_until_pruth_river_campaign_during_7_8(Start,End),AllINtervals), checkvalidity(1675,AllINtervals,Res).

check_query() :- write('Query = age_of_enlightenment_until_pruth_river_campaign_during_7_8_at_1675'), (age_of_enlightenment_until_pruth_river_campaign_during_7_8_at_1675(true) -> write('\nRes   = true');write('\nRes   = false')).

