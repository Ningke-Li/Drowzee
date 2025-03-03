:- include('database.pl').
catholic_league(Start,End) :- begin('catholic_league',_,_,Start), end('catholic_league',_,_,End), Start=<End.

guadalcanal_campaign(Start,End) :- begin('guadalcanal_campaign',_,_,Start), end('guadalcanal_campaign',_,_,End), Start=<End.

generate_facts_catholic_league_OR_guadalcanal_campaign([]) :- assert(catholic_league_OR_guadalcanal_campaign(-1,-1)).

generate_facts_catholic_league_OR_guadalcanal_campaign([(Start,End) | Tail]) :- assert(catholic_league_OR_guadalcanal_campaign(Start,End)), generate_facts_catholic_league_OR_guadalcanal_campaign(Tail).

catholic_league_OR_guadalcanal_campaign_aux() :- findall((Start,End),catholic_league(Start,End),Interval1), findall((Start,End),guadalcanal_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_catholic_league_OR_guadalcanal_campaign(Interval).

catholic_league_OR_guadalcanal_campaign_at_1568(Res) :- setof((Start,End),catholic_league_OR_guadalcanal_campaign(Start,End),AllINtervals), checkvalidity(1568,AllINtervals,Res).

check_query() :- write('Query = catholic_league_OR_guadalcanal_campaign_at_1568'), (catholic_league_OR_guadalcanal_campaign_at_1568(true) -> write('\nRes   = true');write('\nRes   = false')).
?- catholic_league_OR_guadalcanal_campaign_aux().

