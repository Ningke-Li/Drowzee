:- include('database.pl').
austrian_schilling(Start,End) :- begin('austrian_schilling',_,_,Start), end('austrian_schilling',_,_,End), Start=<End.

north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

generate_facts_austrian_schilling_AND_north_african_campaign([]) :- assert(austrian_schilling_AND_north_african_campaign(-1,-1)).

generate_facts_austrian_schilling_AND_north_african_campaign([(Start,End) | Tail]) :- assert(austrian_schilling_AND_north_african_campaign(Start,End)), generate_facts_austrian_schilling_AND_north_african_campaign(Tail).

austrian_schilling_AND_north_african_campaign_aux() :- findall((Start,End),austrian_schilling(Start,End),Interval1), findall((Start,End),north_african_campaign(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_austrian_schilling_AND_north_african_campaign(Interval).

austrian_schilling_AND_north_african_campaign_at_1953(Res) :- setof((Start,End),austrian_schilling_AND_north_african_campaign(Start,End),AllINtervals), checkvalidity(1953,AllINtervals,Res).

check_query() :- write('Query = austrian_schilling_AND_north_african_campaign_at_1953'), (austrian_schilling_AND_north_african_campaign_at_1953(true) -> write('\nRes   = true');write('\nRes   = false')).
?- austrian_schilling_AND_north_african_campaign_aux().

