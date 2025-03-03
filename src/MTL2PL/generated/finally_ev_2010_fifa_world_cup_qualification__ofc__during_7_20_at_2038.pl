:- include('database.pl').
ev_2010_fifa_world_cup_qualification__ofc_(Start,End) :- begin('ev_2010_fifa_world_cup_qualification__ofc_',_,_,Start), end('ev_2010_fifa_world_cup_qualification__ofc_',_,_,End), Start=<End.

finally_ev_2010_fifa_world_cup_qualification__ofc__during_7_20(Start,End) :- ev_2010_fifa_world_cup_qualification__ofc_(Start1,End1), (Start1-20)=<(End1-7), Start is (Start1-20), End is (End1-7), Start=<End.

finally_ev_2010_fifa_world_cup_qualification__ofc__during_7_20_at_2038(Res) :- setof((Start,End),finally_ev_2010_fifa_world_cup_qualification__ofc__during_7_20(Start,End),AllINtervals), checkvalidity(2038,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_fifa_world_cup_qualification__ofc__during_7_20_at_2038'), (finally_ev_2010_fifa_world_cup_qualification__ofc__during_7_20_at_2038(true) -> write('\nRes   = true');write('\nRes   = false')).

