:- include('database.pl').
battle_of_aachen(Start,End) :- begin('battle_of_aachen',_,_,Start), end('battle_of_aachen',_,_,End), Start=<End.

north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

generate_facts_battle_of_aachen_OR_north_african_campaign([]) :- assert(battle_of_aachen_OR_north_african_campaign(-1,-1)).

generate_facts_battle_of_aachen_OR_north_african_campaign([(Start,End) | Tail]) :- assert(battle_of_aachen_OR_north_african_campaign(Start,End)), generate_facts_battle_of_aachen_OR_north_african_campaign(Tail).

battle_of_aachen_OR_north_african_campaign_aux() :- findall((Start,End),battle_of_aachen(Start,End),Interval1), findall((Start,End),north_african_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_battle_of_aachen_OR_north_african_campaign(Interval).

battle_of_aachen_OR_north_african_campaign_at_1864(Res) :- setof((Start,End),battle_of_aachen_OR_north_african_campaign(Start,End),AllINtervals), checkvalidity(1864,AllINtervals,Res).

check_query() :- write('Query = battle_of_aachen_OR_north_african_campaign_at_1864'), (battle_of_aachen_OR_north_african_campaign_at_1864(true) -> write('\nRes   = true');write('\nRes   = false')).
?- battle_of_aachen_OR_north_african_campaign_aux().

