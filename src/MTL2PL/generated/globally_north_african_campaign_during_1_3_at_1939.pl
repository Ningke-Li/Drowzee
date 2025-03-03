:- include('database.pl').
north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

globally_north_african_campaign_during_1_3(Start,End) :- north_african_campaign(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_north_african_campaign_during_1_3_at_1939(Res) :- setof((Start,End),globally_north_african_campaign_during_1_3(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = globally_north_african_campaign_during_1_3_at_1939'), (globally_north_african_campaign_during_1_3_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

