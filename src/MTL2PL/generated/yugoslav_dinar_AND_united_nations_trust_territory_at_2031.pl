:- include('database.pl').
yugoslav_dinar(Start,End) :- begin('yugoslav_dinar',_,_,Start), end('yugoslav_dinar',_,_,End), Start=<End.

united_nations_trust_territory(Start,End) :- begin('united_nations_trust_territory',_,_,Start), end('united_nations_trust_territory',_,_,End), Start=<End.

generate_facts_yugoslav_dinar_AND_united_nations_trust_territory([]) :- assert(yugoslav_dinar_AND_united_nations_trust_territory(-1,-1)).

generate_facts_yugoslav_dinar_AND_united_nations_trust_territory([(Start,End) | Tail]) :- assert(yugoslav_dinar_AND_united_nations_trust_territory(Start,End)), generate_facts_yugoslav_dinar_AND_united_nations_trust_territory(Tail).

yugoslav_dinar_AND_united_nations_trust_territory_aux() :- findall((Start,End),yugoslav_dinar(Start,End),Interval1), findall((Start,End),united_nations_trust_territory(Start,End),Interval2), overlap_two_li(Interval1,Interval2,Interval), generate_facts_yugoslav_dinar_AND_united_nations_trust_territory(Interval).

yugoslav_dinar_AND_united_nations_trust_territory_at_2031(Res) :- setof((Start,End),yugoslav_dinar_AND_united_nations_trust_territory(Start,End),AllINtervals), checkvalidity(2031,AllINtervals,Res).

check_query() :- write('Query = yugoslav_dinar_AND_united_nations_trust_territory_at_2031'), (yugoslav_dinar_AND_united_nations_trust_territory_at_2031(true) -> write('\nRes   = true');write('\nRes   = false')).
?- yugoslav_dinar_AND_united_nations_trust_territory_aux().

