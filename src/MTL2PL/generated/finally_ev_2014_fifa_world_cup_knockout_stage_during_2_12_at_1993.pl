:- include('database.pl').
ev_2014_fifa_world_cup_knockout_stage(Start,End) :- begin('ev_2014_fifa_world_cup_knockout_stage',_,_,Start), end('ev_2014_fifa_world_cup_knockout_stage',_,_,End), Start=<End.

finally_ev_2014_fifa_world_cup_knockout_stage_during_2_12(Start,End) :- ev_2014_fifa_world_cup_knockout_stage(Start1,End1), (Start1-12)=<(End1-2), Start is (Start1-12), End is (End1-2), Start=<End.

finally_ev_2014_fifa_world_cup_knockout_stage_during_2_12_at_1993(Res) :- setof((Start,End),finally_ev_2014_fifa_world_cup_knockout_stage_during_2_12(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2014_fifa_world_cup_knockout_stage_during_2_12_at_1993'), (finally_ev_2014_fifa_world_cup_knockout_stage_during_2_12_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

