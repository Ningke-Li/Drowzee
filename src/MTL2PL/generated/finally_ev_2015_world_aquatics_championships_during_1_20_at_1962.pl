:- include('database.pl').
ev_2015_world_aquatics_championships(Start,End) :- begin('ev_2015_world_aquatics_championships',_,_,Start), end('ev_2015_world_aquatics_championships',_,_,End), Start=<End.

finally_ev_2015_world_aquatics_championships_during_1_20(Start,End) :- ev_2015_world_aquatics_championships(Start1,End1), (Start1-20)=<(End1-1), Start is (Start1-20), End is (End1-1), Start=<End.

finally_ev_2015_world_aquatics_championships_during_1_20_at_1962(Res) :- setof((Start,End),finally_ev_2015_world_aquatics_championships_during_1_20(Start,End),AllINtervals), checkvalidity(1962,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_world_aquatics_championships_during_1_20_at_1962'), (finally_ev_2015_world_aquatics_championships_during_1_20_at_1962(true) -> write('\nRes   = true');write('\nRes   = false')).

