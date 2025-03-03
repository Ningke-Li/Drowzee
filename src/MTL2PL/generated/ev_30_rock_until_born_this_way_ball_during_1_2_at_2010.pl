:- include('database.pl').
ev_30_rock(Start,End) :- begin('ev_30_rock',_,_,Start), end('ev_30_rock',_,_,End), Start=<End.

born_this_way_ball(Start,End) :- begin('born_this_way_ball',_,_,Start), end('born_this_way_ball',_,_,End), Start=<End.

ev_30_rock_last_till_1_2(Start,End) :- ev_30_rock(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

ev_30_rock_until_born_this_way_ball_during_1_2_overlap(Start,End) :- ev_30_rock_last_till_1_2(Start1,End1), born_this_way_ball(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_30_rock_until_born_this_way_ball_during_1_2(Start,End) :- ev_30_rock(W1,_), ev_30_rock_until_born_this_way_ball_during_1_2_overlap(Start1,End1), Start is max((Start1-2),W1), End is (End1-1), Start=<End.

ev_30_rock_until_born_this_way_ball_during_1_2_at_2010(Res) :- setof((Start,End),ev_30_rock_until_born_this_way_ball_during_1_2(Start,End),AllINtervals), checkvalidity(2010,AllINtervals,Res).

check_query() :- write('Query = ev_30_rock_until_born_this_way_ball_during_1_2_at_2010'), (ev_30_rock_until_born_this_way_ball_during_1_2_at_2010(true) -> write('\nRes   = true');write('\nRes   = false')).

