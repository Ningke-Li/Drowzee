:- include('database.pl').
katyn_massacre(Start,End) :- begin('katyn_massacre',_,_,Start), end('katyn_massacre',_,_,End), Start=<End.

next_katyn_massacre(Start,End) :- katyn_massacre(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_katyn_massacre_at_1939(Res) :- setof((Start,End),next_katyn_massacre(Start,End),AllINtervals), checkvalidity(1939,AllINtervals,Res).

check_query() :- write('Query = next_katyn_massacre_at_1939'), (next_katyn_massacre_at_1939(true) -> write('\nRes   = true');write('\nRes   = false')).

