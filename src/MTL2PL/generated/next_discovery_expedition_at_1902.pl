:- include('database.pl').
discovery_expedition(Start,End) :- begin('discovery_expedition',_,_,Start), end('discovery_expedition',_,_,End), Start=<End.

next_discovery_expedition(Start,End) :- discovery_expedition(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_discovery_expedition_at_1902(Res) :- setof((Start,End),next_discovery_expedition(Start,End),AllINtervals), checkvalidity(1902,AllINtervals,Res).

check_query() :- write('Query = next_discovery_expedition_at_1902'), (next_discovery_expedition_at_1902(true) -> write('\nRes   = true');write('\nRes   = false')).

