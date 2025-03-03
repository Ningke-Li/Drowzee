:- include('database.pl').
ev_2013_fifa_club_world_cup(Start,End) :- begin('ev_2013_fifa_club_world_cup',_,_,Start), end('ev_2013_fifa_club_world_cup',_,_,End), Start=<End.

finally_ev_2013_fifa_club_world_cup_during_1_18(Start,End) :- ev_2013_fifa_club_world_cup(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_ev_2013_fifa_club_world_cup_during_1_18_at_2012(Res) :- setof((Start,End),finally_ev_2013_fifa_club_world_cup_during_1_18(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2013_fifa_club_world_cup_during_1_18_at_2012'), (finally_ev_2013_fifa_club_world_cup_during_1_18_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

