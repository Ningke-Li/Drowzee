:- include('database.pl').
enabling_act_of_1933(Start,End) :- begin('enabling_act_of_1933',_,_,Start), end('enabling_act_of_1933',_,_,End), Start=<End.

world_war_ii_in_yugoslavia(Start,End) :- begin('world_war_ii_in_yugoslavia',_,_,Start), end('world_war_ii_in_yugoslavia',_,_,End), Start=<End.

enabling_act_of_1933_last_till_6_11(Start,End) :- enabling_act_of_1933(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

enabling_act_of_1933_until_world_war_ii_in_yugoslavia_during_6_11_overlap(Start,End) :- enabling_act_of_1933_last_till_6_11(Start1,End1), world_war_ii_in_yugoslavia(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

enabling_act_of_1933_until_world_war_ii_in_yugoslavia_during_6_11(Start,End) :- enabling_act_of_1933(W1,_), enabling_act_of_1933_until_world_war_ii_in_yugoslavia_during_6_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-6), Start=<End.

enabling_act_of_1933_until_world_war_ii_in_yugoslavia_during_6_11_at_1896(Res) :- setof((Start,End),enabling_act_of_1933_until_world_war_ii_in_yugoslavia_during_6_11(Start,End),AllINtervals), checkvalidity(1896,AllINtervals,Res).

check_query() :- write('Query = enabling_act_of_1933_until_world_war_ii_in_yugoslavia_during_6_11_at_1896'), (enabling_act_of_1933_until_world_war_ii_in_yugoslavia_during_6_11_at_1896(true) -> write('\nRes   = true');write('\nRes   = false')).

