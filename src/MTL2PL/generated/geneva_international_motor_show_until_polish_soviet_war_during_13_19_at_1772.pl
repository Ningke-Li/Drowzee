:- include('database.pl').
geneva_international_motor_show(Start,End) :- begin('geneva_international_motor_show',_,_,Start), end('geneva_international_motor_show',_,_,End), Start=<End.

polish_soviet_war(Start,End) :- begin('polish_soviet_war',_,_,Start), end('polish_soviet_war',_,_,End), Start=<End.

geneva_international_motor_show_last_till_13_19(Start,End) :- geneva_international_motor_show(Start1,End1), (End1-Start1)>=13, Start is (Start1+13), End is (End1+1).

geneva_international_motor_show_until_polish_soviet_war_during_13_19_overlap(Start,End) :- geneva_international_motor_show_last_till_13_19(Start1,End1), polish_soviet_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

geneva_international_motor_show_until_polish_soviet_war_during_13_19(Start,End) :- geneva_international_motor_show(W1,_), geneva_international_motor_show_until_polish_soviet_war_during_13_19_overlap(Start1,End1), Start is max((Start1-19),W1), End is (End1-13), Start=<End.

geneva_international_motor_show_until_polish_soviet_war_during_13_19_at_1772(Res) :- setof((Start,End),geneva_international_motor_show_until_polish_soviet_war_during_13_19(Start,End),AllINtervals), checkvalidity(1772,AllINtervals,Res).

check_query() :- write('Query = geneva_international_motor_show_until_polish_soviet_war_during_13_19_at_1772'), (geneva_international_motor_show_until_polish_soviet_war_during_13_19_at_1772(true) -> write('\nRes   = true');write('\nRes   = false')).

