:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

uefa_euro_2012_qualifying_group_a(Start,End) :- begin('uefa_euro_2012_qualifying_group_a',_,_,Start), end('uefa_euro_2012_qualifying_group_a',_,_,End), Start=<End.

geneva_international_motor_show_last_till_31_36(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=31, Start is (Start1+31), End is (End1+1).

geneva_international_motor_show_until_uefa_euro_2012_qualifying_group_a_during_31_36_overlap(Start,End) :- geneva_international_motor_show_last_till_31_36(Start1,End1), uefa_euro_2012_qualifying_group_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_uefa_euro_2012_qualifying_group_a_during_31_36(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_uefa_euro_2012_qualifying_group_a_during_31_36_overlap(Start1,End1), Start is max((Start1-36),W1), End is (End1-31), Start=<End.

geneva_international_motor_show_until_uefa_euro_2012_qualifying_group_a_during_31_36_at_1976(Res) :- setof((Start,End),geneva_international_motor_show_until_uefa_euro_2012_qualifying_group_a_during_31_36(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_uefa_euro_2012_qualifying_group_a_during_31_36_at_1976'), (geneva_international_motor_show_until_uefa_euro_2012_qualifying_group_a_during_31_36_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).

