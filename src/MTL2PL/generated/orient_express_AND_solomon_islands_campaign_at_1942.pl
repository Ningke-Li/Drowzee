:- include('database.pl').
orient_express(Start,End) :- begin('orient_express',_,_,Start), end('orient_express',_,_,End), Start=<End.

solomon_islands_campaign(Start,End) :- begin('solomon_islands_campaign',_,_,Start), end('solomon_islands_campaign',_,_,End), Start=<End.

generate_facts_orient_express_AND_solomon_islands_campaign([]) :- assert(orient_express_AND_solomon_islands_campaign(-1,-1)).

generate_facts_orient_express_AND_solomon_islands_campaign([(Start,End) | Tail]) :- assert(orient_express_AND_solomon_islands_campaign(Start,End)), generate_facts_orient_express_AND_solomon_islands_campaign(Tail).

orient_express_AND_solomon_islands_campaign_aux() :- findall((Start,End),orient_express(Start,End),Interval1), findall((Start,End),solomon_islands_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_orient_express_AND_solomon_islands_campaign(Interval).

orient_express_AND_solomon_islands_campaign_at_1942(Res) :- setof((Start,End),orient_express_AND_solomon_islands_campaign(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = orient_express_AND_solomon_islands_campaign_at_1942'), (orient_express_AND_solomon_islands_campaign_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).
?- orient_express_AND_solomon_islands_campaign_aux().

