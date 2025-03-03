:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

globally_operation_bernhard_during_1_3(Start,End) :- operation_bernhard(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

globally_operation_bernhard_during_1_3_at_1941(Res) :- setof((Start,End),globally_operation_bernhard_during_1_3(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = globally_operation_bernhard_during_1_3_at_1941'), (globally_operation_bernhard_during_1_3_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

