:- include('database.pl').
operation_crossroads(Start,End) :- begin('operation_crossroads',_,_,Start), end('operation_crossroads',_,_,End), Start=<End.

finally_operation_crossroads_during_10_16(Start,End) :- operation_crossroads(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_operation_crossroads_during_10_16_at_1933(Res) :- setof((Start,End),finally_operation_crossroads_during_10_16(Start,End),AllINtervals), checkvalidity(1933,AllINtervals,Res).

check_query() :- write('Query = finally_operation_crossroads_during_10_16_at_1933'), (finally_operation_crossroads_during_10_16_at_1933(true) -> write('\nRes   = true');write('\nRes   = false')).

