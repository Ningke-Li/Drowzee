:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

globally_operation_bernhard_during_1_3(Start,End) :- operation_bernhard(Start1,End1), Start is (Start1-1), End is (End1-3), Start=<End.

next_globally_operation_bernhard_during_1_3(Start,End) :- globally_operation_bernhard_during_1_3(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_operation_bernhard_during_1_3_at_1987(Res) :- setof((Start,End),next_globally_operation_bernhard_during_1_3(Start,End),AllINtervals), checkvalidity(1987,AllINtervals,Res).

check_query() :- write('Query = next_globally_operation_bernhard_during_1_3_at_1987'), (next_globally_operation_bernhard_during_1_3_at_1987(true) -> write('\nRes   = true');write('\nRes   = false')).

