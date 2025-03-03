:- include('database.pl').
ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

finally_ev_2018_fifa_world_cup_qualification_during_9_11(Start,End) :- ev_2018_fifa_world_cup_qualification(Start1,End1), (Start1-11)=<(End1-9), Start is (Start1-11), End is (End1-9), Start=<End.

finally_ev_2018_fifa_world_cup_qualification_during_9_11_at_2006(Res) :- setof((Start,End),finally_ev_2018_fifa_world_cup_qualification_during_9_11(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2018_fifa_world_cup_qualification_during_9_11_at_2006'), (finally_ev_2018_fifa_world_cup_qualification_during_9_11_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

