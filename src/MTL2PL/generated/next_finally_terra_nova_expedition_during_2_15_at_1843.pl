:- include('database.pl').
terra_nova_expedition(Start,End) :- begin('terra_nova_expedition',_,_,Start), end('terra_nova_expedition',_,_,End), Start=<End.

finally_terra_nova_expedition_during_2_15(Start,End) :- terra_nova_expedition(Start1,End1), (Start1-15)=<(End1-2), Start is (Start1-15), End is (End1-2), Start=<End.

next_finally_terra_nova_expedition_during_2_15(Start,End) :- finally_terra_nova_expedition_during_2_15(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_terra_nova_expedition_during_2_15_at_1843(Res) :- setof((Start,End),next_finally_terra_nova_expedition_during_2_15(Start,End),AllINtervals), checkvalidity(1843,AllINtervals,Res).

check_query() :- write('Query = next_finally_terra_nova_expedition_during_2_15_at_1843'), (next_finally_terra_nova_expedition_during_2_15_at_1843(true) -> write('\nRes   = true');write('\nRes   = false')).

