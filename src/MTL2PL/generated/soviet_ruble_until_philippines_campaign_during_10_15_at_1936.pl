:- include('database.pl').
soviet_ruble(Start,End) :- begin('soviet_ruble',_,_,Start), end('soviet_ruble',_,_,End), Start=<End.

philippines_campaign(Start,End) :- begin('philippines_campaign',_,_,Start), end('philippines_campaign',_,_,End), Start=<End.

soviet_ruble_last_till_10_15(Start,End) :- soviet_ruble(Start1,End1), (End1-Start1)>=10, Start is (Start1+10), End is (End1+1).

soviet_ruble_until_philippines_campaign_during_10_15_overlap(Start,End) :- soviet_ruble_last_till_10_15(Start1,End1), philippines_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

soviet_ruble_until_philippines_campaign_during_10_15(Start,End) :- soviet_ruble(W1,_), soviet_ruble_until_philippines_campaign_during_10_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-10), Start=<End.

soviet_ruble_until_philippines_campaign_during_10_15_at_1936(Res) :- setof((Start,End),soviet_ruble_until_philippines_campaign_during_10_15(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = soviet_ruble_until_philippines_campaign_during_10_15_at_1936'), (soviet_ruble_until_philippines_campaign_during_10_15_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

