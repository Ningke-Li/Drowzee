:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

globally_geneva_international_motor_show_during_60_112(Start,End) :- geneva_international_motor_show(Start1,End1), Start is (Start1-60), End is (End1-112), Start=<End.

finally_globally_geneva_international_motor_show_during_60_112_during_10_19(Start,End) :- globally_geneva_international_motor_show_during_60_112(Start1,End1), (Start1-19)=<(End1-10), Start is (Start1-19), End is (End1-10), Start=<End.

finally_globally_geneva_international_motor_show_during_60_112_during_10_19_at_1882(Res) :- setof((Start,End),finally_globally_geneva_international_motor_show_during_60_112_during_10_19(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = finally_globally_geneva_international_motor_show_during_60_112_during_10_19_at_1882'), (finally_globally_geneva_international_motor_show_during_60_112_during_10_19_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).

