:- include('database.pl').
operation_bernhard(Start,End) :- begin('operation_bernhard',_,_,Start), end('operation_bernhard',_,_,End), Start=<End.

finally_operation_bernhard_during_7_13(Start,End) :- operation_bernhard(Start1,End1), (Start1-13)=<(End1-7), Start is (Start1-13), End is (End1-7), Start=<End.

next_finally_operation_bernhard_during_7_13(Start,End) :- finally_operation_bernhard_during_7_13(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_operation_bernhard_during_7_13_at_1814(Res) :- setof((Start,End),next_finally_operation_bernhard_during_7_13(Start,End),AllINtervals), checkvalidity(1814,AllINtervals,Res).

check_query() :- write('Query = next_finally_operation_bernhard_during_7_13_at_1814'), (next_finally_operation_bernhard_during_7_13_at_1814(true) -> write('\nRes   = true');write('\nRes   = false')).

