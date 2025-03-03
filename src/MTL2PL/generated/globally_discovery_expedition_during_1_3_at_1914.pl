:- include('database.pl').
discovery_expedition(Start,End) :- begin('discovery_expedition',_,_,Start), end('discovery_expedition',_,_,End), Start=<End.

globally_discovery_expedition_during_1_3(Start,End) :- discovery_expedition(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_discovery_expedition_during_1_3_at_1914(Res) :- setof((Start,End),globally_discovery_expedition_during_1_3(Start,End),AllINtervals), checkvalidity(1914,AllINtervals,Res).

check_query() :- write('Query = globally_discovery_expedition_during_1_3_at_1914'), (globally_discovery_expedition_during_1_3_at_1914(true) -> write('\nRes   = true');write('\nRes   = false')).

