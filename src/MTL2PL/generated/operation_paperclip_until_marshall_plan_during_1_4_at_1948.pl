:- include('database.pl').
operation_paperclip(Start,End) :- begin('operation_paperclip',_,_,Start), end('operation_paperclip',_,_,End), Start=<End.

marshall_plan(Start,End) :- begin('marshall_plan',_,_,Start), end('marshall_plan',_,_,End), Start=<End.

operation_paperclip_last_till_1_4(Start,End) :- operation_paperclip(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

operation_paperclip_until_marshall_plan_during_1_4_overlap(Start,End) :- operation_paperclip_last_till_1_4(Start1,End1), marshall_plan(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

operation_paperclip_until_marshall_plan_during_1_4(Start,End) :- operation_paperclip(W1,_), operation_paperclip_until_marshall_plan_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

operation_paperclip_until_marshall_plan_during_1_4_at_1948(Res) :- setof((Start,End),operation_paperclip_until_marshall_plan_during_1_4(Start,End),AllINtervals), checkvalidity(1948,AllINtervals,Res).

check_query() :- write('Query = operation_paperclip_until_marshall_plan_during_1_4_at_1948'), (operation_paperclip_until_marshall_plan_during_1_4_at_1948(true) -> write('\nRes   = true');write('\nRes   = false')).

