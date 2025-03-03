:- include('database.pl').
ev_2009_world_championships_in_athletics(Start,End) :- begin('ev_2009_world_championships_in_athletics',_,_,Start), end('ev_2009_world_championships_in_athletics',_,_,End), Start=<End.

finally_ev_2009_world_championships_in_athletics_during_1_19(Start,End) :- ev_2009_world_championships_in_athletics(Start1,End1), (Start1-19)=<(End1-1), Start is (Start1-19), End is (End1-1), Start=<End.

finally_ev_2009_world_championships_in_athletics_during_1_19_at_1943(Res) :- setof((Start,End),finally_ev_2009_world_championships_in_athletics_during_1_19(Start,End),AllINtervals), checkvalidity(1943,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_world_championships_in_athletics_during_1_19_at_1943'), (finally_ev_2009_world_championships_in_athletics_during_1_19_at_1943(true) -> write('\nRes   = true');write('\nRes   = false')).

