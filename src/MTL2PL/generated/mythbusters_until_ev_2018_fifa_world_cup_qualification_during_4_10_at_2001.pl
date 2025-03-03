:- include('database.pl').
mythbusters(Start,End) :- begin('mythbusters',_,_,Start), end('mythbusters',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

mythbusters_last_till_4_10(Start,End) :- mythbusters(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

mythbusters_until_ev_2018_fifa_world_cup_qualification_during_4_10_overlap(Start,End) :- mythbusters_last_till_4_10(Start1,End1), ev_2018_fifa_world_cup_qualification(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mythbusters_until_ev_2018_fifa_world_cup_qualification_during_4_10(Start,End) :- mythbusters(W1,_), mythbusters_until_ev_2018_fifa_world_cup_qualification_during_4_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-4), Start=<End.

mythbusters_until_ev_2018_fifa_world_cup_qualification_during_4_10_at_2001(Res) :- setof((Start,End),mythbusters_until_ev_2018_fifa_world_cup_qualification_during_4_10(Start,End),AllINtervals), checkvalidity(2001,AllINtervals,Res).

check_query() :- write('Query = mythbusters_until_ev_2018_fifa_world_cup_qualification_during_4_10_at_2001'), (mythbusters_until_ev_2018_fifa_world_cup_qualification_during_4_10_at_2001(true) -> write('\nRes   = true');write('\nRes   = false')).

