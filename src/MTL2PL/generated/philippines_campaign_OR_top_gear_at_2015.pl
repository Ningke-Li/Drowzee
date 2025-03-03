:- include('database.pl').
philippines_campaign(Start,End) :- begin('philippines_campaign',_,_,Start), end('philippines_campaign',_,_,End), Start=<End.

top_gear(Start,End) :- begin('top_gear',_,_,Start), end('top_gear',_,_,End), Start=<End.

generate_facts_philippines_campaign_OR_top_gear([]) :- assert(philippines_campaign_OR_top_gear(-1,-1)).

generate_facts_philippines_campaign_OR_top_gear([(Start,End) | Tail]) :- assert(philippines_campaign_OR_top_gear(Start,End)), generate_facts_philippines_campaign_OR_top_gear(Tail).

philippines_campaign_OR_top_gear_aux() :- findall((Start,End),philippines_campaign(Start,End),Interval1), findall((Start,End),top_gear(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_philippines_campaign_OR_top_gear(Interval).

philippines_campaign_OR_top_gear_at_2015(Res) :- setof((Start,End),philippines_campaign_OR_top_gear(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = philippines_campaign_OR_top_gear_at_2015'), (philippines_campaign_OR_top_gear_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).
?- philippines_campaign_OR_top_gear_aux().

