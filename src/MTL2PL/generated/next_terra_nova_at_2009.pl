:- include('database.pl').
terra_nova(Start,End) :- begin('terra_nova',_,_,Start), end('terra_nova',_,_,End), Start=<End.

next_terra_nova(Start,End) :- terra_nova(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_terra_nova_at_2009(Res) :- setof((Start,End),next_terra_nova(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = next_terra_nova_at_2009'), (next_terra_nova_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

