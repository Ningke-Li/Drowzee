:- include('database.pl').
ev_1938_fifa_world_cup(Start,End) :- begin('ev_1938_fifa_world_cup',_,_,Start), end('ev_1938_fifa_world_cup',_,_,End), Start=<End.

finally_ev_1938_fifa_world_cup_during_9_12(Start,End) :- ev_1938_fifa_world_cup(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_ev_1938_fifa_world_cup_during_9_12_at_1877(Res) :- setof((Start,End),finally_ev_1938_fifa_world_cup_during_9_12(Start,End),AllINtervals), checkvalidity(1877,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1938_fifa_world_cup_during_9_12_at_1877'), (finally_ev_1938_fifa_world_cup_during_9_12_at_1877(true) -> write('\nRes   = true');write('\nRes   = false')).

