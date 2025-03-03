:- include('database.pl').
soviet_ruble(Start,End) :- begin('soviet_ruble',_,_,Start), end('soviet_ruble',_,_,End), Start=<End.

italian_campaign(Start,End) :- begin('italian_campaign',_,_,Start), end('italian_campaign',_,_,End), Start=<End.

soviet_ruble_last_till_12_16(Start,End) :- soviet_ruble(Start1,End1), (End1-Start1)>=12, Start is (Start1+12), End is (End1+1).

soviet_ruble_until_italian_campaign_during_12_16_overlap(Start,End) :- soviet_ruble_last_till_12_16(Start1,End1), italian_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

soviet_ruble_until_italian_campaign_during_12_16(Start,End) :- soviet_ruble(W1,_), soviet_ruble_until_italian_campaign_during_12_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-12), Start=<End.

soviet_ruble_until_italian_campaign_during_12_16_at_1931(Res) :- setof((Start,End),soviet_ruble_until_italian_campaign_during_12_16(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = soviet_ruble_until_italian_campaign_during_12_16_at_1931'), (soviet_ruble_until_italian_campaign_during_12_16_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

