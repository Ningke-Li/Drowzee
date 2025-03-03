:- include('database.pl').
ev_2009_fifa_club_world_cup(Start,End) :- begin('ev_2009_fifa_club_world_cup',_,_,Start), end('ev_2009_fifa_club_world_cup',_,_,End), Start=<End.

next_ev_2009_fifa_club_world_cup(Start,End) :- ev_2009_fifa_club_world_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2009_fifa_club_world_cup_at_1917(Res) :- setof((Start,End),next_ev_2009_fifa_club_world_cup(Start,End),AllINtervals), checkvalidity(1917,AllINtervals,Res).

check_query() :- write('Query = next_ev_2009_fifa_club_world_cup_at_1917'), (next_ev_2009_fifa_club_world_cup_at_1917(true) -> write('\nRes   = true');write('\nRes   = false')).

