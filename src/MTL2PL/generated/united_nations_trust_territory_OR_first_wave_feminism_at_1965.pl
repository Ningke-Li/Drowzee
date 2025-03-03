:- include('database.pl').
united_nations_trust_territory(Start,End) :- begin('united_nations_trust_territory',_,_,Start), end('united_nations_trust_territory',_,_,End), Start=<End.

first_wave_feminism(Start,End) :- begin('first_wave_feminism',_,_,Start), end('first_wave_feminism',_,_,End), Start=<End.

generate_facts_united_nations_trust_territory_OR_first_wave_feminism([]) :- assert(united_nations_trust_territory_OR_first_wave_feminism(-1,-1)).

generate_facts_united_nations_trust_territory_OR_first_wave_feminism([(Start,End) | Tail]) :- assert(united_nations_trust_territory_OR_first_wave_feminism(Start,End)), generate_facts_united_nations_trust_territory_OR_first_wave_feminism(Tail).

united_nations_trust_territory_OR_first_wave_feminism_aux() :- findall((Start,End),united_nations_trust_territory(Start,End),Interval1), findall((Start,End),first_wave_feminism(Start,End),Interval2), append1(Interval1,Interval2,Interval), generate_facts_united_nations_trust_territory_OR_first_wave_feminism(Interval).

united_nations_trust_territory_OR_first_wave_feminism_at_1965(Res) :- setof((Start,End),united_nations_trust_territory_OR_first_wave_feminism(Start,End),AllINtervals), checkvalidity(1965,AllINtervals,Res).

check_query() :- write('Query = united_nations_trust_territory_OR_first_wave_feminism_at_1965'), (united_nations_trust_territory_OR_first_wave_feminism_at_1965(true) -> write('\nRes   = true');write('\nRes   = false')).
?- united_nations_trust_territory_OR_first_wave_feminism_aux().

