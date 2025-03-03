:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

globally_world_heavyweight_championship_rey_mysterio_during_1_12(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), Start is (Start1-1), End is (End1-12), Start=<End.

finally_globally_world_heavyweight_championship_rey_mysterio_during_1_12_during_1_11(Start,End) :- globally_world_heavyweight_championship_rey_mysterio_during_1_12(Start1,End1), (Start1-11)=<(End1-1), Start is (Start1-11), End is (End1-1), Start=<End.

finally_globally_world_heavyweight_championship_rey_mysterio_during_1_12_during_1_11_at_1993(Res) :- setof((Start,End),finally_globally_world_heavyweight_championship_rey_mysterio_during_1_12_during_1_11(Start,End),AllINtervals), checkvalidity(1993,AllINtervals,Res).

check_query() :- write('Query = finally_globally_world_heavyweight_championship_rey_mysterio_during_1_12_during_1_11_at_1993'), (finally_globally_world_heavyweight_championship_rey_mysterio_during_1_12_during_1_11_at_1993(true) -> write('\nRes   = true');write('\nRes   = false')).

