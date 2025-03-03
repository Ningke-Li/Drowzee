:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

next_operation_bernhard(Start,End) :- operation_bernhard(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_operation_bernhard_at_1941(Res) :- setof((Start,End),next_operation_bernhard(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = next_operation_bernhard_at_1941'), (next_operation_bernhard_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

