:- include('database.pl').
ev_2006_fifa_world_cup(Start,End) :- begin('ev_2006_fifa_world_cup',_,_,Start), end('ev_2006_fifa_world_cup',_,_,End), Start=<End.

finally_ev_2006_fifa_world_cup_during_8_16(Start,End) :- ev_2006_fifa_world_cup(Start1,End1), (Start1-16)=<(End1-8), Start is (Start1-16), End is (End1-8), Start=<End.

finally_ev_2006_fifa_world_cup_during_8_16_at_1990(Res) :- setof((Start,End),finally_ev_2006_fifa_world_cup_during_8_16(Start,End),AllINtervals), checkvalidity(1990,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2006_fifa_world_cup_during_8_16_at_1990'), (finally_ev_2006_fifa_world_cup_during_8_16_at_1990(true) -> write('\nRes   = true');write('\nRes   = false')).

