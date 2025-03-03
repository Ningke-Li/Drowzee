:- include('database.pl').
nazism(Start,End) :- begin('nazism',_,_,Start), end('nazism',_,_,End), Start=<End.

malayan_campaign(Start,End) :- begin('malayan_campaign',_,_,Start), end('malayan_campaign',_,_,End), Start=<End.

nazism_last_till_17_23(Start,End) :- nazism(Start1,End1), (End1-Start1)>=17, Start is (Start1+17), End is (End1+1).

nazism_until_malayan_campaign_during_17_23_overlap(Start,End) :- nazism_last_till_17_23(Start1,End1), malayan_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

nazism_until_malayan_campaign_during_17_23(Start,End) :- nazism(W1,_), nazism_until_malayan_campaign_during_17_23_overlap(Start1,End1), Start is max((Start1-23),W1), End is (End1-17), Start=<End.

nazism_until_malayan_campaign_during_17_23_at_1925(Res) :- setof((Start,End),nazism_until_malayan_campaign_during_17_23(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = nazism_until_malayan_campaign_during_17_23_at_1925'), (nazism_until_malayan_campaign_during_17_23_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

