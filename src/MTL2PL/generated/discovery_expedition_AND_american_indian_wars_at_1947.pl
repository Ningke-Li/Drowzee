:- include('database.pl').
discovery_expedition(Start,End) :- begin('discovery_expedition',_,_,Start), end('discovery_expedition',_,_,End), Start=<End.

american_indian_wars(Start,End) :- begin('american_indian_wars',_,_,Start), end('american_indian_wars',_,_,End), Start=<End.

generate_facts_discovery_expedition_AND_american_indian_wars([]) :- assert(discovery_expedition_AND_american_indian_wars(-1,-1)).

generate_facts_discovery_expedition_AND_american_indian_wars([(Start,End) | Tail]) :- assert(discovery_expedition_AND_american_indian_wars(Start,End)), generate_facts_discovery_expedition_AND_american_indian_wars(Tail).

discovery_expedition_AND_american_indian_wars_aux() :- findall((Start,End),discovery_expedition(Start,End),Interval1), findall((Start,End),american_indian_wars(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_discovery_expedition_AND_american_indian_wars(Interval).

discovery_expedition_AND_american_indian_wars_at_1947(Res) :- setof((Start,End),discovery_expedition_AND_american_indian_wars(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = discovery_expedition_AND_american_indian_wars_at_1947'), (discovery_expedition_AND_american_indian_wars_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).
?- discovery_expedition_AND_american_indian_wars_aux().

