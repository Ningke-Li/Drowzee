:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

finally_geneva_international_motor_show_during_10_13(Start,End) :- geneva_international_motor_show(Start1,End1), (Start1-13)=<(End1-10), Start is (Start1-13), End is (End1-10), Start=<End.

finally_geneva_international_motor_show_during_10_13_at_1765(Res) :- setof((Start,End),finally_geneva_international_motor_show_during_10_13(Start,End),AllINtervals), checkvalidity(1765,AllINtervals,Res).

check_query() :- write('Query = finally_geneva_international_motor_show_during_10_13_at_1765'), (finally_geneva_international_motor_show_during_10_13_at_1765(true) -> write('\nRes   = true');write('\nRes   = false')).

