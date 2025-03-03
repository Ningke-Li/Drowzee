:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

malayan_campaign(Start,End) :- begin('malayan_campaign',_,_,Start), end('malayan_campaign',_,_,End), Start=<End.

indian_independence_movement_last_till_55_60(Start,End) :- indian_independence_movement(Start1,End1), (End1-Start1)>=55, Start is (Start1+55), End is (End1+1).

indian_independence_movement_until_malayan_campaign_during_55_60_overlap(Start,End) :- indian_independence_movement_last_till_55_60(Start1,End1), malayan_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indian_independence_movement_until_malayan_campaign_during_55_60(Start,End) :- indian_independence_movement(W1,_), indian_independence_movement_until_malayan_campaign_during_55_60_overlap(Start1,End1), Start is max((Start1-60),W1), End is (End1-55), Start=<End.

indian_independence_movement_until_malayan_campaign_during_55_60_at_1904(Res) :- setof((Start,End),indian_independence_movement_until_malayan_campaign_during_55_60(Start,End),AllINtervals), checkvalidity(1904,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_until_malayan_campaign_during_55_60_at_1904'), (indian_independence_movement_until_malayan_campaign_during_55_60_at_1904(true) -> write('\nRes   = true');write('\nRes   = false')).

