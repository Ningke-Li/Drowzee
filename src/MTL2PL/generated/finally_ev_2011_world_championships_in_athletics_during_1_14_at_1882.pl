:- include('database.pl').
ev_2011_world_championships_in_athletics(Start,End) :- begin('ev_2011_world_championships_in_athletics',_,_,Start), end('ev_2011_world_championships_in_athletics',_,_,End), Start=<End.

finally_ev_2011_world_championships_in_athletics_during_1_14(Start,End) :- ev_2011_world_championships_in_athletics(Start1,End1), (Start1-14)=<(End1-1), Start is (Start1-14), End is (End1-1), Start=<End.

finally_ev_2011_world_championships_in_athletics_during_1_14_at_1882(Res) :- setof((Start,End),finally_ev_2011_world_championships_in_athletics_during_1_14(Start,End),AllINtervals), checkvalidity(1882,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2011_world_championships_in_athletics_during_1_14_at_1882'), (finally_ev_2011_world_championships_in_athletics_during_1_14_at_1882(true) -> write('\nRes   = true');write('\nRes   = false')).

