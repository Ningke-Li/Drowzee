:- include('database.pl').
north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

next_north_african_campaign(Start,End) :- north_african_campaign(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_north_african_campaign_at_1846(Res) :- setof((Start,End),next_north_african_campaign(Start,End),AllINtervals), checkvalidity(1846,AllINtervals,Res).

check_query() :- write('Query = next_north_african_campaign_at_1846'), (next_north_african_campaign_at_1846(true) -> write('\nRes   = true');write('\nRes   = false')).

