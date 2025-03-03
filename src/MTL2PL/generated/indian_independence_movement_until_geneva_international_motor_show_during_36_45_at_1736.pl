:- include('database.pl').
indian_independence_movement(Start,End) :- begin('indian_independence_movement',_,_,Start), end('indian_independence_movement',_,_,End), Start=<End.

geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

indian_independence_movement_last_till_36_45(Start,End) :- indian_independence_movement(Start1,End1), (End1-Start1)>=36, Start is (Start1+36), End is (End1+1).

indian_independence_movement_until_geneva_international_motor_show_during_36_45_overlap(Start,End) :- indian_independence_movement_last_till_36_45(Start1,End1), geneva_international_motor_show(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

indian_independence_movement_until_geneva_international_motor_show_during_36_45(Start,End) :- indian_independence_movement(W1,_), indian_independence_movement_until_geneva_international_motor_show_during_36_45_overlap(Start1,End1), Start is max((Start1-45),W1), End is (End1-36), Start=<End.

indian_independence_movement_until_geneva_international_motor_show_during_36_45_at_1736(Res) :- setof((Start,End),indian_independence_movement_until_geneva_international_motor_show_during_36_45(Start,End),AllINtervals), checkvalidity(1736,AllINtervals,Res).

check_query() :- write('Query = indian_independence_movement_until_geneva_international_motor_show_during_36_45_at_1736'), (indian_independence_movement_until_geneva_international_motor_show_during_36_45_at_1736(true) -> write('\nRes   = true');write('\nRes   = false')).

