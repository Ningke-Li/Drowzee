:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

finally_world_heavyweight_championship_rey_mysterio_during_4_19(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), (Start1-19)=<(End1-4), Start is (Start1-19), End is (End1-4), Start=<End.

finally_world_heavyweight_championship_rey_mysterio_during_4_19_at_2000(Res) :- setof((Start,End),finally_world_heavyweight_championship_rey_mysterio_during_4_19(Start,End),AllINtervals), checkvalidity(2000,AllINtervals,Res).

check_query() :- write('Query = finally_world_heavyweight_championship_rey_mysterio_during_4_19_at_2000'), (finally_world_heavyweight_championship_rey_mysterio_during_4_19_at_2000(true) -> write('\nRes   = true');write('\nRes   = false')).

