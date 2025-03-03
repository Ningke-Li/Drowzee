:- include('database.pl').
mesopotamian_campaign(Start,End) :- begin('mesopotamian_campaign',_,_,Start), end('mesopotamian_campaign',_,_,End), Start=<End.

finally_mesopotamian_campaign_during_6_20(Start,End) :- mesopotamian_campaign(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

finally_mesopotamian_campaign_during_6_20_at_1911(Res) :- setof((Start,End),finally_mesopotamian_campaign_during_6_20(Start,End),AllINtervals), checkvalidity(1911,AllINtervals,Res).

check_query() :- write('Query = finally_mesopotamian_campaign_during_6_20_at_1911'), (finally_mesopotamian_campaign_during_6_20_at_1911(true) -> write('\nRes   = true');write('\nRes   = false')).

