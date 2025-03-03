:- include('database.pl').
serbian_campaign(Start,End) :- begin('serbian_campaign',_,_,Start), end('serbian_campaign',_,_,End), Start=<End.

orphan_black(Start,End) :- begin('orphan_black',_,_,Start), end('orphan_black',_,_,End), Start=<End.

generate_facts_serbian_campaign_OR_orphan_black([]) :- assert(serbian_campaign_OR_orphan_black(-1,-1)).

generate_facts_serbian_campaign_OR_orphan_black([(Start,End) | Tail]) :- assert(serbian_campaign_OR_orphan_black(Start,End)), generate_facts_serbian_campaign_OR_orphan_black(Tail).

serbian_campaign_OR_orphan_black_aux() :- findall((Start,End),serbian_campaign(Start,End),Interval1), findall((Start,End),orphan_black(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_serbian_campaign_OR_orphan_black(Interval).

serbian_campaign_OR_orphan_black_at_1914(Res) :- setof((Start,End),serbian_campaign_OR_orphan_black(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = serbian_campaign_OR_orphan_black_at_1914'), (serbian_campaign_OR_orphan_black_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).
?- serbian_campaign_OR_orphan_black_aux().

