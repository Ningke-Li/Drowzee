:- include('database.pl').
ev_2010_fifa_world_cup_qualification__ofc_(Start,End) :- begin('ev_2010_fifa_world_cup_qualification__ofc_',_,_,Start), end('ev_2010_fifa_world_cup_qualification__ofc_',_,_,End), Start=<End.

next_ev_2010_fifa_world_cup_qualification__ofc_(Start,End) :- ev_2010_fifa_world_cup_qualification__ofc_(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2010_fifa_world_cup_qualification__ofc__at_2007(Res) :- setof((Start,End),next_ev_2010_fifa_world_cup_qualification__ofc_(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = next_ev_2010_fifa_world_cup_qualification__ofc__at_2007'), (next_ev_2010_fifa_world_cup_qualification__ofc__at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

