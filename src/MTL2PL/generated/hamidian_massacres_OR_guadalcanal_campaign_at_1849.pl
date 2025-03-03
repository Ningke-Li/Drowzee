:- include('database.pl').
hamidian_massacres(Start,End) :- begin('hamidian_massacres',_,_,Start), end('hamidian_massacres',_,_,End), Start=<End.

guadalcanal_campaign(Start,End) :- begin('guadalcanal_campaign',_,_,Start), end('guadalcanal_campaign',_,_,End), Start=<End.

generate_facts_hamidian_massacres_OR_guadalcanal_campaign([]) :- assert(hamidian_massacres_OR_guadalcanal_campaign(-1,-1)).

generate_facts_hamidian_massacres_OR_guadalcanal_campaign([(Start,End) | Tail]) :- assert(hamidian_massacres_OR_guadalcanal_campaign(Start,End)), generate_facts_hamidian_massacres_OR_guadalcanal_campaign(Tail).

hamidian_massacres_OR_guadalcanal_campaign_aux() :- findall((Start,End),hamidian_massacres(Start,End),Interval1), findall((Start,End),guadalcanal_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_hamidian_massacres_OR_guadalcanal_campaign(Interval).

hamidian_massacres_OR_guadalcanal_campaign_at_1849(Res) :- setof((Start,End),hamidian_massacres_OR_guadalcanal_campaign(Start,End),AllINtervals), checkvalidity(1849,AllINtervals,Res).

check_query() :- write('Query = hamidian_massacres_OR_guadalcanal_campaign_at_1849'), (hamidian_massacres_OR_guadalcanal_campaign_at_1849(true) -> write('\nRes   = true');write('\nRes   = false')).
?- hamidian_massacres_OR_guadalcanal_campaign_aux().

