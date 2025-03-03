:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

geneva_international_motor_show_last_till_21_31(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=21, Start is (Start1+21), End is (End1+1).

geneva_international_motor_show_until_lithuanian_litas_during_21_31_overlap(Start,End) :- geneva_international_motor_show_last_till_21_31(Start1,End1), lithuanian_litas(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_lithuanian_litas_during_21_31(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_lithuanian_litas_during_21_31_overlap(Start1,End1), Start is max((Start1-31),W1), End is (End1-21), Start=<End.

geneva_international_motor_show_until_lithuanian_litas_during_21_31_at_1888(Res) :- setof((Start,End),geneva_international_motor_show_until_lithuanian_litas_during_21_31(Start,End),AllINtervals), checkvalidity(1888,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_lithuanian_litas_during_21_31_at_1888'), (geneva_international_motor_show_until_lithuanian_litas_during_21_31_at_1888(true) -> write('\nRes   = true');write('\nRes   = false')).

