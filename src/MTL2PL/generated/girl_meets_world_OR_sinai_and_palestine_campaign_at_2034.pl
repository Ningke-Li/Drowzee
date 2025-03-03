:- include('database.pl').
girl_meets_world(Start,End) :- begin('girl_meets_world',_,_,Start), end('girl_meets_world',_,_,End), Start=<End.

sinai_and_palestine_campaign(Start,End) :- begin('sinai_and_palestine_campaign',_,_,Start), end('sinai_and_palestine_campaign',_,_,End), Start=<End.

generate_facts_girl_meets_world_OR_sinai_and_palestine_campaign([]) :- assert(girl_meets_world_OR_sinai_and_palestine_campaign(-1,-1)).

generate_facts_girl_meets_world_OR_sinai_and_palestine_campaign([(Start,End) | Tail]) :- assert(girl_meets_world_OR_sinai_and_palestine_campaign(Start,End)), generate_facts_girl_meets_world_OR_sinai_and_palestine_campaign(Tail).

girl_meets_world_OR_sinai_and_palestine_campaign_aux() :- findall((Start,End),girl_meets_world(Start,End),Interval1), findall((Start,End),sinai_and_palestine_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_girl_meets_world_OR_sinai_and_palestine_campaign(Interval).

girl_meets_world_OR_sinai_and_palestine_campaign_at_2034(Res) :- setof((Start,End),girl_meets_world_OR_sinai_and_palestine_campaign(Start,End),AllINtervals), checkvalidity(2034,AllINtervals,Res).

check_query() :- write('Query = girl_meets_world_OR_sinai_and_palestine_campaign_at_2034'), (girl_meets_world_OR_sinai_and_palestine_campaign_at_2034(true) -> write('\nRes   = true');write('\nRes   = false')).
?- girl_meets_world_OR_sinai_and_palestine_campaign_aux().

