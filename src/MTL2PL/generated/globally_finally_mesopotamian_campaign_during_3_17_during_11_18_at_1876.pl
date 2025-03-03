:- include('database.pl').
mesopotamian_campaign(Start,End) :- begin('mesopotamian_campaign',_,_,Start), end('mesopotamian_campaign',_,_,End), Start=<End.

finally_mesopotamian_campaign_during_3_17(Start,End) :- mesopotamian_campaign(Start1,End1), (Start1-17)=<(End1-3), Start is (Start1-17), End is (End1-3), Start=<End.

globally_finally_mesopotamian_campaign_during_3_17_during_11_18(Start,End) :- finally_mesopotamian_campaign_during_3_17(Start1,End1), Start is (Start1-11), End is (End1-18), Start=<End.

globally_finally_mesopotamian_campaign_during_3_17_during_11_18_at_1876(Res) :- setof((Start,End),globally_finally_mesopotamian_campaign_during_3_17_during_11_18(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = globally_finally_mesopotamian_campaign_during_3_17_during_11_18_at_1876'), (globally_finally_mesopotamian_campaign_during_3_17_during_11_18_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

