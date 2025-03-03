:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

girls(Start,End) :- begin('girls',_,_,Start), end('girls',_,_,End), Start=<End.

geneva_international_motor_show_last_till_56_60(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=56, Start is (Start1+56), End is (End1+1).

geneva_international_motor_show_until_girls_during_56_60_overlap(Start,End) :- geneva_international_motor_show_last_till_56_60(Start1,End1), girls(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_girls_during_56_60(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_girls_during_56_60_overlap(Start1,End1), Start is max((Start1-60),W1), End is (End1-56), Start=<End.

geneva_international_motor_show_until_girls_during_56_60_at_1947(Res) :- setof((Start,End),geneva_international_motor_show_until_girls_during_56_60(Start,End),AllINtervals), checkvalidity(1947,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_girls_during_56_60_at_1947'), (geneva_international_motor_show_until_girls_during_56_60_at_1947(true) -> write('\nRes   = true');write('\nRes   = false')).

