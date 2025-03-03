:- include('database.pl').
united_nations_trust_territory(Start,End) :- begin('united_nations_trust_territory',_,_,Start), end('united_nations_trust_territory',_,_,End), Start=<End.

globally_united_nations_trust_territory_during_4_49(Start,End) :- united_nations_trust_territory(Start1,End1), Start is (Start1-4), End is (End1-49), Start=<End.

next_globally_united_nations_trust_territory_during_4_49(Start,End) :- globally_united_nations_trust_territory_during_4_49(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_united_nations_trust_territory_during_4_49_at_1851(Res) :- setof((Start,End),next_globally_united_nations_trust_territory_during_4_49(Start,End),AllINtervals), checkvalidity(1851,AllINtervals,Res).

check_query() :- write('Query = next_globally_united_nations_trust_territory_during_4_49_at_1851'), (next_globally_united_nations_trust_territory_during_4_49_at_1851(true) -> write('\nRes   = true');write('\nRes   = false')).

