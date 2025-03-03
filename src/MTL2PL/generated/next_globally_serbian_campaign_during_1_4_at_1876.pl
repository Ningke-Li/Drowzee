:- include('database.pl').
serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

globally_serbian_campaign_during_1_4(Start,End) :- serbian_campaign(Start1,End1), Start is (Start1-1), End is (End1-4), Start=<End.

next_globally_serbian_campaign_during_1_4(Start,End) :- globally_serbian_campaign_during_1_4(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_serbian_campaign_during_1_4_at_1876(Res) :- setof((Start,End),next_globally_serbian_campaign_during_1_4(Start,End),AllINtervals), checkvalidity(1876,AllINtervals,Res).

check_query() :- write('Query = next_globally_serbian_campaign_during_1_4_at_1876'), (next_globally_serbian_campaign_during_1_4_at_1876(true) -> write('\nRes   = true');write('\nRes   = false')).

