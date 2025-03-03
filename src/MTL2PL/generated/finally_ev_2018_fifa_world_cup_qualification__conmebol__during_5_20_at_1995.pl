:- include('database.pl').
ev_2018_fifa_world_cup_qualification__conmebol_(Start,End) :- begin('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,Start), end('ev_2018_fifa_world_cup_qualification__conmebol_',_,_,End), Start=<End.

finally_ev_2018_fifa_world_cup_qualification__conmebol__during_5_20(Start,End) :- ev_2018_fifa_world_cup_qualification__conmebol_(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_ev_2018_fifa_world_cup_qualification__conmebol__during_5_20_at_1995(Res) :- setof((Start,End),finally_ev_2018_fifa_world_cup_qualification__conmebol__during_5_20(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2018_fifa_world_cup_qualification__conmebol__during_5_20_at_1995'), (finally_ev_2018_fifa_world_cup_qualification__conmebol__during_5_20_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

