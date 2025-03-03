:- include('database.pl').
north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

finally_north_african_campaign_during_6_18(Start,End) :- north_african_campaign(Start1,End1), (Start1-18)=<(End1-6), Start is (Start1-18), End is (End1-6), Start=<End.

next_finally_north_african_campaign_during_6_18(Start,End) :- finally_north_african_campaign_during_6_18(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_north_african_campaign_during_6_18_at_1879(Res) :- setof((Start,End),next_finally_north_african_campaign_during_6_18(Start,End),AllINtervals), checkvalidity(1879,AllINtervals,Res).

check_query() :- write('Query = next_finally_north_african_campaign_during_6_18_at_1879'), (next_finally_north_african_campaign_during_6_18_at_1879(true) -> write('\nRes   = true');write('\nRes   = false')).

