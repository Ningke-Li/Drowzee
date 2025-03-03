:- include('database.pl').
mesopotamian_campaign(Start,End) :- begin('mesopotamian_campaign',_,_,Start), end('mesopotamian_campaign',_,_,End), Start=<End.

next_mesopotamian_campaign(Start,End) :- mesopotamian_campaign(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_mesopotamian_campaign_at_1917(Res) :- setof((Start,End),next_mesopotamian_campaign(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = next_mesopotamian_campaign_at_1917'), (next_mesopotamian_campaign_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

