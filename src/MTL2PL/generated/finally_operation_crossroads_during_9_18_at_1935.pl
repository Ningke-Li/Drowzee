:- include('database.pl').
operation_crossroads(Start,End) :- begin('operation_crossroads',_,_,Start), end('operation_crossroads',_,_,End), Start=<End.

finally_operation_crossroads_during_9_18(Start,End) :- operation_crossroads(Start1,End1), (Start1-18)=<(End1-9), Start is (Start1-18), End is (End1-9), Start=<End.

finally_operation_crossroads_during_9_18_at_1935(Res) :- setof((Start,End),finally_operation_crossroads_during_9_18(Start,End),AllINtervals), checkvalidity(1935,AllINtervals,Res).

check_query() :- write('Query = finally_operation_crossroads_during_9_18_at_1935'), (finally_operation_crossroads_during_9_18_at_1935(true) -> write('\nRes   = true');write('\nRes   = false')).

