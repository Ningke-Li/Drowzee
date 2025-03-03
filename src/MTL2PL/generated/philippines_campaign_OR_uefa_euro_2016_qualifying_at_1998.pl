:- include('database.pl').
philippines_campaign(Start,End) :- begin('philippines_campaign',_,_,Start), end('philippines_campaign',_,_,End), Start=<End.

uefa_euro_2016_qualifying(Start,End) :- begin('uefa_euro_2016_qualifying',_,_,Start), end('uefa_euro_2016_qualifying',_,_,End), Start=<End.

generate_facts_philippines_campaign_OR_uefa_euro_2016_qualifying([]) :- assert(philippines_campaign_OR_uefa_euro_2016_qualifying(-1,-1)).

generate_facts_philippines_campaign_OR_uefa_euro_2016_qualifying([(Start,End) | Tail]) :- assert(philippines_campaign_OR_uefa_euro_2016_qualifying(Start,End)), generate_facts_philippines_campaign_OR_uefa_euro_2016_qualifying(Tail).

philippines_campaign_OR_uefa_euro_2016_qualifying_aux() :- findall((Start,End),philippines_campaign(Start,End),Interval1), findall((Start,End),uefa_euro_2016_qualifying(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_philippines_campaign_OR_uefa_euro_2016_qualifying(Interval).

philippines_campaign_OR_uefa_euro_2016_qualifying_at_1998(Res) :- setof((Start,End),philippines_campaign_OR_uefa_euro_2016_qualifying(Start,End),AllINtervals), checkvalidity(1998,AllINtervals,Res).

check_query() :- write('Query = philippines_campaign_OR_uefa_euro_2016_qualifying_at_1998'), (philippines_campaign_OR_uefa_euro_2016_qualifying_at_1998(true) -> write('\nRes   = true');write('\nRes   = false')).
?- philippines_campaign_OR_uefa_euro_2016_qualifying_aux().

