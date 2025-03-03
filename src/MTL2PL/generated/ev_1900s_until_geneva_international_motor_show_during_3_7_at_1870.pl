:- include('database.pl').
ev_1900s(Start,End) :- begin('ev_1900s',_,_,Start), end('ev_1900s',_,_,End), Start=<End.

geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

ev_1900s_last_till_3_7(Start,End) :- ev_1900s(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

ev_1900s_until_geneva_international_motor_show_during_3_7_overlap(Start,End) :- ev_1900s_last_till_3_7(Start1,End1), geneva_international_motor_show(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_1900s_until_geneva_international_motor_show_during_3_7(Start,End) :- ev_1900s(W1,_), ev_1900s_until_geneva_international_motor_show_during_3_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-3), Start=<End.

ev_1900s_until_geneva_international_motor_show_during_3_7_at_1870(Res) :- setof((Start,End),ev_1900s_until_geneva_international_motor_show_during_3_7(Start,End),AllINtervals), checkvalidity(1870,AllINtervals,Res).

check_query() :- write('Query = ev_1900s_until_geneva_international_motor_show_during_3_7_at_1870'), (ev_1900s_until_geneva_international_motor_show_during_3_7_at_1870(true) -> write('\nRes   = true');write('\nRes   = false')).

