:- include('database.pl').
ev_2010_fifa_world_cup_qualification(Start,End) :- begin('ev_2010_fifa_world_cup_qualification',_,_,Start), end('ev_2010_fifa_world_cup_qualification',_,_,End), Start=<End.

finally_ev_2010_fifa_world_cup_qualification_during_2_18(Start,End) :- ev_2010_fifa_world_cup_qualification(Start1,End1), (Start1-18)=<(End1-2), Start is (Start1-18), End is (End1-2), Start=<End.

finally_ev_2010_fifa_world_cup_qualification_during_2_18_at_1840(Res) :- setof((Start,End),finally_ev_2010_fifa_world_cup_qualification_during_2_18(Start,End),AllINtervals), checkvalidity(1840,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2010_fifa_world_cup_qualification_during_2_18_at_1840'), (finally_ev_2010_fifa_world_cup_qualification_during_2_18_at_1840(true) -> write('\nRes   = true');write('\nRes   = false')).

