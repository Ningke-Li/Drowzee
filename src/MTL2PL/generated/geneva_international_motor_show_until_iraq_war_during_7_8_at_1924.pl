:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

iraq_war(Start,End) :- begin('iraq_war',_,_,Start), end('iraq_war',_,_,End), Start=<End.

geneva_international_motor_show_last_till_7_8(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

geneva_international_motor_show_until_iraq_war_during_7_8_overlap(Start,End) :- geneva_international_motor_show_last_till_7_8(Start1,End1), iraq_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_iraq_war_during_7_8(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_iraq_war_during_7_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-7), Start=<End.

geneva_international_motor_show_until_iraq_war_during_7_8_at_1924(Res) :- setof((Start,End),geneva_international_motor_show_until_iraq_war_during_7_8(Start,End),AllINtervals), checkvalidity(1924,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_iraq_war_during_7_8_at_1924'), (geneva_international_motor_show_until_iraq_war_during_7_8_at_1924(true) -> write('\nRes   = true');write('\nRes   = false')).

