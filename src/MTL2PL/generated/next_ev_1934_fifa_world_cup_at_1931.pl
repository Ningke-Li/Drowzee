:- include('database.pl').
ev_1934_fifa_world_cup(Start,End) :- begin('ev_1934_fifa_world_cup',_,_,Start), end('ev_1934_fifa_world_cup',_,_,End), Start=<End.

next_ev_1934_fifa_world_cup(Start,End) :- ev_1934_fifa_world_cup(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_1934_fifa_world_cup_at_1931(Res) :- setof((Start,End),next_ev_1934_fifa_world_cup(Start,End),AllINtervals), checkvalidity(1931,AllINtervals,Res).

check_query() :- write('Query = next_ev_1934_fifa_world_cup_at_1931'), (next_ev_1934_fifa_world_cup_at_1931(true) -> write('\nRes   = true');write('\nRes   = false')).

