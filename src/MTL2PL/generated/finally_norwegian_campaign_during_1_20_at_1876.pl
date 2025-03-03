:- include('database.pl').
norwegian_campaign(Start,End) :- begin('norwegian_campaign',_,_,Start), end('norwegian_campaign',_,_,End), Start=<End.

finally_norwegian_campaign_during_1_20(Start,End) :- norwegian_campaign(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

finally_norwegian_campaign_during_1_20_at_1876(Res) :- setof((Start,End),finally_norwegian_campaign_during_1_20(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = finally_norwegian_campaign_during_1_20_at_1876'), (finally_norwegian_campaign_during_1_20_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

