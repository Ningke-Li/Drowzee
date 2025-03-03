:- include('database.pl').
league_of_nations_mandate(Start,End) :- begin('league_of_nations_mandate',_,_,Start), end('league_of_nations_mandate',_,_,End), Start=<End.

north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

generate_facts_league_of_nations_mandate_AND_north_african_campaign([]) :- assert(league_of_nations_mandate_AND_north_african_campaign(-1,-1)).

generate_facts_league_of_nations_mandate_AND_north_african_campaign([(Start,End) | Tail]) :- assert(league_of_nations_mandate_AND_north_african_campaign(Start,End)), generate_facts_league_of_nations_mandate_AND_north_african_campaign(Tail).

league_of_nations_mandate_AND_north_african_campaign_aux() :- findall((Start,End),league_of_nations_mandate(Start,End),Interval1), findall((Start,End),north_african_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_league_of_nations_mandate_AND_north_african_campaign(Interval).

league_of_nations_mandate_AND_north_african_campaign_at_1935(Res) :- setof((Start,End),league_of_nations_mandate_AND_north_african_campaign(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = league_of_nations_mandate_AND_north_african_campaign_at_1935'), (league_of_nations_mandate_AND_north_african_campaign_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).
?- league_of_nations_mandate_AND_north_african_campaign_aux().

