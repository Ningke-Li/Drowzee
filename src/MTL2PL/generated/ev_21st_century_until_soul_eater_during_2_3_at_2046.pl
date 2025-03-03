:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

soul_eater(Start,End) :- begin('soul_eater',_,_,Start), end('soul_eater',_,_,End), Start=<End.

ev_21st_century_last_till_2_3(Start,End) :- ev_21st_century(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

ev_21st_century_until_soul_eater_during_2_3_overlap(Start,End) :- ev_21st_century_last_till_2_3(Start1,End1), soul_eater(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_21st_century_until_soul_eater_during_2_3(Start,End) :- ev_21st_century(W1,_), ev_21st_century_until_soul_eater_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

ev_21st_century_until_soul_eater_during_2_3_at_2046(Res) :- setof((Start,End),ev_21st_century_until_soul_eater_during_2_3(Start,End),AllINtervals), checkvalidity(2046,AllINtervals,Res).

check_query() :- write('Query = ev_21st_century_until_soul_eater_during_2_3_at_2046'), (ev_21st_century_until_soul_eater_during_2_3_at_2046(true) -> write('\nRes   = true');write('\nRes   = false')).

