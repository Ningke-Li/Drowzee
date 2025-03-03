:- include('database.pl').
pruth_river_campaign(Start,End) :- begin('pruth_river_campaign',_,_,Start), end('pruth_river_campaign',_,_,End), Start=<End.

next_pruth_river_campaign(Start,End) :- pruth_river_campaign(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_pruth_river_campaign_at_1644(Res) :- setof((Start,End),next_pruth_river_campaign(Start,End),AllINtervals), checkvalidity(1644,AllINtervals,Res).

check_query() :- write('Query = next_pruth_river_campaign_at_1644'), (next_pruth_river_campaign_at_1644(true) -> write('\nRes   = true');write('\nRes   = false')).

