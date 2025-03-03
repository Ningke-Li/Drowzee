:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

avatar__the_last_airbender(Start,End) :- begin('avatar__the_last_airbender',_,_,Start), end('avatar__the_last_airbender',_,_,End), Start=<End.

geneva_international_motor_show_last_till_17_27(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=17, Start is (Start1+17), End is (End1+1).

geneva_international_motor_show_until_avatar__the_last_airbender_during_17_27_overlap(Start,End) :- geneva_international_motor_show_last_till_17_27(Start1,End1), avatar__the_last_airbender(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_avatar__the_last_airbender_during_17_27(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_avatar__the_last_airbender_during_17_27_overlap(Start1,End1), Start is max((Start1-27),W1), End is (End1-17), Start=<End.

geneva_international_motor_show_until_avatar__the_last_airbender_during_17_27_at_1845(Res) :- setof((Start,End),geneva_international_motor_show_until_avatar__the_last_airbender_during_17_27(Start,End),AllINtervals), checkvalidity(1845,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_avatar__the_last_airbender_during_17_27_at_1845'), (geneva_international_motor_show_until_avatar__the_last_airbender_during_17_27_at_1845(true) -> write('\nRes   = true');write('\nRes   = false')).

