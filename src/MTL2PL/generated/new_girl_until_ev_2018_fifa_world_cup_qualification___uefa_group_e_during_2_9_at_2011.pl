:- include('database.pl').
new_girl(Start,End) :- begin('new_girl',_,_,Start), end('new_girl',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification___uefa_group_e(Start,End) :- begin('ev_2018_fifa_world_cup_qualification___uefa_group_e',_,_,Start), end('ev_2018_fifa_world_cup_qualification___uefa_group_e',_,_,End), Start=<End.

new_girl_last_till_2_9(Start,End) :- new_girl(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

new_girl_until_ev_2018_fifa_world_cup_qualification___uefa_group_e_during_2_9_overlap(Start,End) :- new_girl_last_till_2_9(Start1,End1), ev_2018_fifa_world_cup_qualification___uefa_group_e(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

new_girl_until_ev_2018_fifa_world_cup_qualification___uefa_group_e_during_2_9(Start,End) :- new_girl(W1,_), new_girl_until_ev_2018_fifa_world_cup_qualification___uefa_group_e_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

new_girl_until_ev_2018_fifa_world_cup_qualification___uefa_group_e_during_2_9_at_2011(Res) :- setof((Start,End),new_girl_until_ev_2018_fifa_world_cup_qualification___uefa_group_e_during_2_9(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = new_girl_until_ev_2018_fifa_world_cup_qualification___uefa_group_e_during_2_9_at_2011'), (new_girl_until_ev_2018_fifa_world_cup_qualification___uefa_group_e_during_2_9_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

