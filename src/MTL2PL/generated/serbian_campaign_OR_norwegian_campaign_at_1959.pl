:- include('database.pl').
serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

norwegian_campaign(Start,End) :- begin('norwegian_campaign',_,_,Start), end('norwegian_campaign',_,_,End), Start=<End.

generate_facts_serbian_campaign_OR_norwegian_campaign([]) :- assert(serbian_campaign_OR_norwegian_campaign(-1,-1)).

generate_facts_serbian_campaign_OR_norwegian_campaign([(Start,End) | Tail]) :- assert(serbian_campaign_OR_norwegian_campaign(Start,End)), generate_facts_serbian_campaign_OR_norwegian_campaign(Tail).

serbian_campaign_OR_norwegian_campaign_aux() :- findall((Start,End),serbian_campaign(Start,End),Interval1), findall((Start,End),norwegian_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_serbian_campaign_OR_norwegian_campaign(Interval).

serbian_campaign_OR_norwegian_campaign_at_1959(Res) :- setof((Start,End),serbian_campaign_OR_norwegian_campaign(Start,End),AllINtervals), checkvalidity(1959,AllINtervals,Res).

check_query() :- write('Query = serbian_campaign_OR_norwegian_campaign_at_1959'), (serbian_campaign_OR_norwegian_campaign_at_1959(true) -> write('\nRes   = true');write('\nRes   = false')).
?- serbian_campaign_OR_norwegian_campaign_aux().

