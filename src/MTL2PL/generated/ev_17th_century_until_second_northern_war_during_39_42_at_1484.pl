:- include('database.pl').
ev_17th_century(Start,End) :- begin('ev_17th_century',_,_,Start), end('ev_17th_century',_,_,End), Start=<End.

second_northern_war(Start,End) :- begin('second_northern_war',_,_,Start), end('second_northern_war',_,_,End), Start=<End.

ev_17th_century_last_till_39_42(Start,End) :- ev_17th_century(Start1,End1), (End1-Start1)>=39, Start is (Start1+39), End is (End1+1).

ev_17th_century_until_second_northern_war_during_39_42_overlap(Start,End) :- ev_17th_century_last_till_39_42(Start1,End1), second_northern_war(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_17th_century_until_second_northern_war_during_39_42(Start,End) :- ev_17th_century(W1,_), ev_17th_century_until_second_northern_war_during_39_42_overlap(Start1,End1), Start is max((Start1-42),W1), End is (End1-39), Start=<End.

ev_17th_century_until_second_northern_war_during_39_42_at_1484(Res) :- setof((Start,End),ev_17th_century_until_second_northern_war_during_39_42(Start,End),AllINtervals), checkvalidity(1484,AllINtervals,Res).

check_query() :- write('Query = ev_17th_century_until_second_northern_war_during_39_42_at_1484'), (ev_17th_century_until_second_northern_war_during_39_42_at_1484(true) -> write('\nRes   = true');write('\nRes   = false')).

