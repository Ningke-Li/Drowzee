:- include('database.pl').
manhattan_project(Start,End) :- begin('manhattan_project',_,_,Start), end('manhattan_project',_,_,End), Start=<End.

tunisia_campaign(Start,End) :- begin('tunisia_campaign',_,_,Start), end('tunisia_campaign',_,_,End), Start=<End.

manhattan_project_last_till_1_8(Start,End) :- manhattan_project(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

manhattan_project_until_tunisia_campaign_during_1_8_overlap(Start,End) :- manhattan_project_last_till_1_8(Start1,End1), tunisia_campaign(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

manhattan_project_until_tunisia_campaign_during_1_8(Start,End) :- manhattan_project(W1,_), manhattan_project_until_tunisia_campaign_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

manhattan_project_until_tunisia_campaign_during_1_8_at_1818(Res) :- setof((Start,End),manhattan_project_until_tunisia_campaign_during_1_8(Start,End),AllINtervals), checkvalidity(1818,AllINtervals,Res).

check_query() :- write('Query = manhattan_project_until_tunisia_campaign_during_1_8_at_1818'), (manhattan_project_until_tunisia_campaign_during_1_8_at_1818(true) -> write('\nRes   = true');write('\nRes   = false')).

