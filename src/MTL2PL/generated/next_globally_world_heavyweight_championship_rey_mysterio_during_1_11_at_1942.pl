:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

globally_world_heavyweight_championship_rey_mysterio_during_1_11(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), Start is (Start1-1), End is (End1-11), Start=<End.

next_globally_world_heavyweight_championship_rey_mysterio_during_1_11(Start,End) :- globally_world_heavyweight_championship_rey_mysterio_during_1_11(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_world_heavyweight_championship_rey_mysterio_during_1_11_at_1942(Res) :- setof((Start,End),next_globally_world_heavyweight_championship_rey_mysterio_during_1_11(Start,End),AllINtervals), checkvalidity(1942,AllINtervals,Res).

check_query() :- write('Query = next_globally_world_heavyweight_championship_rey_mysterio_during_1_11_at_1942'), (next_globally_world_heavyweight_championship_rey_mysterio_during_1_11_at_1942(true) -> write('\nRes   = true');write('\nRes   = false')).

