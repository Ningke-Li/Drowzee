:- include('database.pl').
ev_2002_fiba_world_championship(Start,End) :- begin('ev_2002_fiba_world_championship',_,_,Start), end('ev_2002_fiba_world_championship',_,_,End), Start=<End.

finally_ev_2002_fiba_world_championship_during_9_12(Start,End) :- ev_2002_fiba_world_championship(Start1,End1), (Start1-12)=<(End1-9), Start is (Start1-12), End is (End1-9), Start=<End.

finally_ev_2002_fiba_world_championship_during_9_12_at_1979(Res) :- setof((Start,End),finally_ev_2002_fiba_world_championship_during_9_12(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2002_fiba_world_championship_during_9_12_at_1979'), (finally_ev_2002_fiba_world_championship_during_9_12_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

