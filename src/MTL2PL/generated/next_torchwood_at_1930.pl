:- include('database.pl').
torchwood(Start,End) :- begin('torchwood',_,_,Start), end('torchwood',_,_,End), Start=<End.

next_torchwood(Start,End) :- torchwood(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_torchwood_at_1930(Res) :- setof((Start,End),next_torchwood(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = next_torchwood_at_1930'), (next_torchwood_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).

