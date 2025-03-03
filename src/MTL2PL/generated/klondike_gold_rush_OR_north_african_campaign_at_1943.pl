:- include('database.pl').
klondike_gold_rush(Start,End) :- begin('klondike_gold_rush',_,_,Start), end('klondike_gold_rush',_,_,End), Start=<End.

north_african_campaign(Start,End) :- begin('north_african_campaign',_,_,Start), end('north_african_campaign',_,_,End), Start=<End.

generate_facts_klondike_gold_rush_OR_north_african_campaign([]) :- assert(klondike_gold_rush_OR_north_african_campaign(-1,-1)).

generate_facts_klondike_gold_rush_OR_north_african_campaign([(Start,End) | Tail]) :- assert(klondike_gold_rush_OR_north_african_campaign(Start,End)), generate_facts_klondike_gold_rush_OR_north_african_campaign(Tail).

klondike_gold_rush_OR_north_african_campaign_aux() :- findall((Start,End),klondike_gold_rush(Start,End),Interval1), findall((Start,End),north_african_campaign(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_klondike_gold_rush_OR_north_african_campaign(Interval).

klondike_gold_rush_OR_north_african_campaign_at_1943(Res) :- setof((Start,End),klondike_gold_rush_OR_north_african_campaign(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = klondike_gold_rush_OR_north_african_campaign_at_1943'), (klondike_gold_rush_OR_north_african_campaign_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).
?- klondike_gold_rush_OR_north_african_campaign_aux().

