:- include('database.pl').
serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

finally_serbian_campaign_during_4_14(Start,End) :- serbian_campaign(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_serbian_campaign_during_4_14_at_1818(Res) :- setof((Start,End),finally_serbian_campaign_during_4_14(Start,End),AllINtervals), checkvalidity(1818,AllINtervals,Res).

check_query() :- write('Query = finally_serbian_campaign_during_4_14_at_1818'), (finally_serbian_campaign_during_4_14_at_1818(true) -> write('\nRes   = true');write('\nRes   = false')).

