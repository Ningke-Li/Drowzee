:- include('database.pl').
ev_2003_world_championships_in_athletics(Start,End) :- begin('ev_2003_world_championships_in_athletics',_,_,Start), end('ev_2003_world_championships_in_athletics',_,_,End), Start=<End.

next_ev_2003_world_championships_in_athletics(Start,End) :- ev_2003_world_championships_in_athletics(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_ev_2003_world_championships_in_athletics_at_2025(Res) :- setof((Start,End),next_ev_2003_world_championships_in_athletics(Start,End),AllINtervals), checkvalidity(2025,AllINtervals,Res).

check_query() :- write('Query = next_ev_2003_world_championships_in_athletics_at_2025'), (next_ev_2003_world_championships_in_athletics_at_2025(true) -> write('\nRes   = true');write('\nRes   = false')).

