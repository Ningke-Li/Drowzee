:- include('database.pl').
terra_nova(Start,End) :- begin('terra_nova',_,_,Start), end('terra_nova',_,_,End), Start=<End.

next_terra_nova(Start,End) :- terra_nova(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_terra_nova_at_1863(Res) :- setof((Start,End),next_terra_nova(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = next_terra_nova_at_1863'), (next_terra_nova_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).

