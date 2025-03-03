:- include('database.pl').
salvadoran_col_n(Start,End) :- begin('salvadoran_col_n',_,_,Start), end('salvadoran_col_n',_,_,End), Start=<End.

north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

salvadoran_col_n_last_till_4_5(Start,End) :- salvadoran_col_n(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

salvadoran_col_n_until_north_african_campaign_during_4_5_overlap(Start,End) :- salvadoran_col_n_last_till_4_5(Start1,End1), north_african_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

salvadoran_col_n_until_north_african_campaign_during_4_5(Start,End) :- salvadoran_col_n(W1,_), salvadoran_col_n_until_north_african_campaign_during_4_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-4), Start=<End.

salvadoran_col_n_until_north_african_campaign_during_4_5_at_1827(Res) :- setof((Start,End),salvadoran_col_n_until_north_african_campaign_during_4_5(Start,End),AllINtervals), checkvalidity(1827,AllINtervals,Res).

check_query() :- write('Query = salvadoran_col_n_until_north_african_campaign_during_4_5_at_1827'), (salvadoran_col_n_until_north_african_campaign_during_4_5_at_1827(true) -> write('\nRes   = true');write('\nRes   = false')).

