:- include('database.pl').
operation_paperclip(Start,End) :- begin('operation_paperclip',_,_,Start), end('operation_paperclip',_,_,End), Start=<End.

finally_operation_paperclip_during_2_16(Start,End) :- operation_paperclip(Start1,End1), (Start1-16)=<(End1-2), Start is (Start1-16), End is (End1-2), Start=<End.

finally_operation_paperclip_during_2_16_at_1936(Res) :- setof((Start,End),finally_operation_paperclip_during_2_16(Start,End),AllINtervals), checkvalidity(1936,AllINtervals,Res).

check_query() :- write('Query = finally_operation_paperclip_during_2_16_at_1936'), (finally_operation_paperclip_during_2_16_at_1936(true) -> write('\nRes   = true');write('\nRes   = false')).

