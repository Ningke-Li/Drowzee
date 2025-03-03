:- include('database.pl').
chinese_civil_war(Start,End) :- begin('chinese_civil_war',_,_,Start), end('chinese_civil_war',_,_,End), Start=<End.

solomon_islands_campaign(Start,End) :- begin('solomon_islands_campaign',_,_,Start), end('solomon_islands_campaign',_,_,End), Start=<End.

chinese_civil_war_last_till_1_5(Start,End) :- chinese_civil_war(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

chinese_civil_war_until_solomon_islands_campaign_during_1_5_overlap(Start,End) :- chinese_civil_war_last_till_1_5(Start1,End1), solomon_islands_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

chinese_civil_war_until_solomon_islands_campaign_during_1_5(Start,End) :- chinese_civil_war(W1,_), chinese_civil_war_until_solomon_islands_campaign_during_1_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-1), Start=<End.

chinese_civil_war_until_solomon_islands_campaign_during_1_5_at_1884(Res) :- setof((Start,End),chinese_civil_war_until_solomon_islands_campaign_during_1_5(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = chinese_civil_war_until_solomon_islands_campaign_during_1_5_at_1884'), (chinese_civil_war_until_solomon_islands_campaign_during_1_5_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

