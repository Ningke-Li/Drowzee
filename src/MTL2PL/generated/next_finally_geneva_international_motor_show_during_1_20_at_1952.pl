:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

finally_geneva_international_motor_show_during_1_20(Start,End) :- geneva_international_motor_show(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

next_finally_geneva_international_motor_show_during_1_20(Start,End) :- finally_geneva_international_motor_show_during_1_20(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_geneva_international_motor_show_during_1_20_at_1952(Res) :- setof((Start,End),next_finally_geneva_international_motor_show_during_1_20(Start,End),AllINtervals), checkvalidity(1952,AllINtervals,Res).

check_query() :- write('Query = next_finally_geneva_international_motor_show_during_1_20_at_1952'), (next_finally_geneva_international_motor_show_during_1_20_at_1952(true) -> write('\nRes   = true');write('\nRes   = false')).

