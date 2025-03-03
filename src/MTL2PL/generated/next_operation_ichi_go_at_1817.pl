:- include('database.pl').
operation_ichi_go(Start,End) :- begin('operation_ichi_go',_,_,Start), end('operation_ichi_go',_,_,End), Start=<End.

next_operation_ichi_go(Start,End) :- operation_ichi_go(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_operation_ichi_go_at_1817(Res) :- setof((Start,End),next_operation_ichi_go(Start,End),AllINtervals), checkvalidity(1817,AllINtervals,Res).

check_query() :- write('Query = next_operation_ichi_go_at_1817'), (next_operation_ichi_go_at_1817(true) -> write('\nRes   = true');write('\nRes   = false')).

