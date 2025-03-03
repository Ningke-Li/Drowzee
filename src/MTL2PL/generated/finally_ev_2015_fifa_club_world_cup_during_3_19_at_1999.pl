:- include('database.pl').
ev_2015_fifa_club_world_cup(Start,End) :- begin('ev_2015_fifa_club_world_cup',_,_,Start), end('ev_2015_fifa_club_world_cup',_,_,End), Start=<End.

finally_ev_2015_fifa_club_world_cup_during_3_19(Start,End) :- ev_2015_fifa_club_world_cup(Start1,End1), (Start1-19)=<(End1-3), Start is (Start1-19), End is (End1-3), Start=<End.

finally_ev_2015_fifa_club_world_cup_during_3_19_at_1999(Res) :- setof((Start,End),finally_ev_2015_fifa_club_world_cup_during_3_19(Start,End),AllINtervals), checkvalidity(1999,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_fifa_club_world_cup_during_3_19_at_1999'), (finally_ev_2015_fifa_club_world_cup_during_3_19_at_1999(true) -> write('\nRes   = true');write('\nRes   = false')).

