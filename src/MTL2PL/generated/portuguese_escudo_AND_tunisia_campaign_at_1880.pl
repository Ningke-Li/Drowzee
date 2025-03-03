:- include('database.pl').
portuguese_escudo(Start,End) :- begin('portuguese_escudo',_,_,Start), end('portuguese_escudo',_,_,End), Start=<End.

tunisia_campaign(Start,End) :- begin('tunisia_campaign',_,_,Start), end('tunisia_campaign',_,_,End), Start=<End.

generate_facts_portuguese_escudo_AND_tunisia_campaign([]) :- assert(portuguese_escudo_AND_tunisia_campaign(-1,-1)).

generate_facts_portuguese_escudo_AND_tunisia_campaign([(Start,End) | Tail]) :- assert(portuguese_escudo_AND_tunisia_campaign(Start,End)), generate_facts_portuguese_escudo_AND_tunisia_campaign(Tail).

portuguese_escudo_AND_tunisia_campaign_aux() :- findall((Start,End),portuguese_escudo(Start,End),Interval1), findall((Start,End),tunisia_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_portuguese_escudo_AND_tunisia_campaign(Interval).

portuguese_escudo_AND_tunisia_campaign_at_1880(Res) :- setof((Start,End),portuguese_escudo_AND_tunisia_campaign(Start,End),AllINtervals), checkvalidity(1880,AllINtervals,Res).

check_query() :- write('Query = portuguese_escudo_AND_tunisia_campaign_at_1880'), (portuguese_escudo_AND_tunisia_campaign_at_1880(true) -> write('\nRes   = true');write('\nRes   = false')).
?- portuguese_escudo_AND_tunisia_campaign_aux().

