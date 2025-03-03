:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

v(Start,End) :- begin('v',_,_,Start), end('v',_,_,End), Start=<End.

geneva_international_motor_show_last_till_7_16(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

geneva_international_motor_show_until_v_during_7_16_overlap(Start,End) :- geneva_international_motor_show_last_till_7_16(Start1,End1), v(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_v_during_7_16(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_v_during_7_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-7), Start=<End.

geneva_international_motor_show_until_v_during_7_16_at_1997(Res) :- setof((Start,End),geneva_international_motor_show_until_v_during_7_16(Start,End),AllINtervals), checkvalidity(1997,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_v_during_7_16_at_1997'), (geneva_international_motor_show_until_v_during_7_16_at_1997(true) -> write('\nRes   = true');write('\nRes   = false')).

