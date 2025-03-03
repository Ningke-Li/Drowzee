:- include('database.pl').
philippines_campaign(Start,End) :- begin('philippines_campaign',_,_,Start), end('philippines_campaign',_,_,End), Start=<End.

next_philippines_campaign(Start,End) :- philippines_campaign(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_philippines_campaign_at_1955(Res) :- setof((Start,End),next_philippines_campaign(Start,End),AllINtervals), checkvalidity(1955,AllINtervals,Res).

check_query() :- write('Query = next_philippines_campaign_at_1955'), (next_philippines_campaign_at_1955(true) -> write('\nRes   = true');write('\nRes   = false')).

