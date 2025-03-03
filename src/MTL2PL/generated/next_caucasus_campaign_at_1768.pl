:- include('database.pl').
caucasus_campaign(Start,End) :- begin('caucasus_campaign',_,_,Start), end('caucasus_campaign',_,_,End), Start=<End.

next_caucasus_campaign(Start,End) :- caucasus_campaign(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_caucasus_campaign_at_1768(Res) :- setof((Start,End),next_caucasus_campaign(Start,End),AllINtervals), checkvalidity(1768,AllINtervals,Res).

check_query() :- write('Query = next_caucasus_campaign_at_1768'), (next_caucasus_campaign_at_1768(true) -> write('\nRes   = true');write('\nRes   = false')).

