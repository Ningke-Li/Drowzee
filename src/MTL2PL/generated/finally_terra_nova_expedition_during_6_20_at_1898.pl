:- include('database.pl').
terra_nova_expedition(Start,End) :- begin('terra_nova_expedition',_,_,Start), end('terra_nova_expedition',_,_,End), Start=<End.

finally_terra_nova_expedition_during_6_20(Start,End) :- terra_nova_expedition(Start1,End1), (Start1-20)=<(End1-6), Start is (Start1-20), End is (End1-6), Start=<End.

finally_terra_nova_expedition_during_6_20_at_1898(Res) :- setof((Start,End),finally_terra_nova_expedition_during_6_20(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = finally_terra_nova_expedition_during_6_20_at_1898'), (finally_terra_nova_expedition_during_6_20_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).

