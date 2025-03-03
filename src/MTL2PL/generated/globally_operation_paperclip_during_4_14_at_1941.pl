:- include('database.pl').
operation_paperclip(Start,End) :- begin('operation_paperclip',_,_,Start), end('operation_paperclip',_,_,End), Start=<End.

globally_operation_paperclip_during_4_14(Start,End) :- operation_paperclip(Start1,End1), Start is (Start1-4), End is (End1-14), Start=<End.

globally_operation_paperclip_during_4_14_at_1941(Res) :- setof((Start,End),globally_operation_paperclip_during_4_14(Start,End),AllINtervals), checkvalidity(1941,AllINtervals,Res).

check_query() :- write('Query = globally_operation_paperclip_during_4_14_at_1941'), (globally_operation_paperclip_during_4_14_at_1941(true) -> write('\nRes   = true');write('\nRes   = false')).

