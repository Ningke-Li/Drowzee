:- include('database.pl').
peseta(Start,End) :- begin('peseta',_,_,Start), end('peseta',_,_,End), Start=<End.

sinai_and_palestine_campaign(Start,End) :- begin('sinai_and_palestine_campaign',_,_,Start), end('sinai_and_palestine_campaign',_,_,End), Start=<End.

peseta_last_till_20_23(Start,End) :- peseta(Start1,End1), (End1-Start1)>=20, Start is (Start1+20), End is (End1+1).

peseta_until_sinai_and_palestine_campaign_during_20_23_overlap(Start,End) :- peseta_last_till_20_23(Start1,End1), sinai_and_palestine_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

peseta_until_sinai_and_palestine_campaign_during_20_23(Start,End) :- peseta(W1,_), peseta_until_sinai_and_palestine_campaign_during_20_23_overlap(Start1,End1), Start is max((Start1-23),W1), End is (End1-20), Start=<End.

peseta_until_sinai_and_palestine_campaign_during_20_23_at_1828(Res) :- setof((Start,End),peseta_until_sinai_and_palestine_campaign_during_20_23(Start,End),AllINtervals), checkvalidity(1828,AllINtervals,Res).

check_query() :- write('Query = peseta_until_sinai_and_palestine_campaign_during_20_23_at_1828'), (peseta_until_sinai_and_palestine_campaign_during_20_23_at_1828(true) -> write('\nRes   = true');write('\nRes   = false')).

