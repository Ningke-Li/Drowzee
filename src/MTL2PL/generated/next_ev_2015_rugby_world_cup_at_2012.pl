:- include('database.pl').
ev_2015_rugby_world_cup(Start,End) :- begin('ev_2015_rugby_world_cup',_,_,Start), end('ev_2015_rugby_world_cup',_,_,End), Start=<End.

next_ev_2015_rugby_world_cup(Start,End) :- ev_2015_rugby_world_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2015_rugby_world_cup_at_2012(Res) :- setof((Start,End),next_ev_2015_rugby_world_cup(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = next_ev_2015_rugby_world_cup_at_2012'), (next_ev_2015_rugby_world_cup_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

