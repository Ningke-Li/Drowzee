:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

globally_world_heavyweight_championship_rey_mysterio_during_8_9(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), Start is (Start1-8), End is (End1-9), Start=<End.

globally_world_heavyweight_championship_rey_mysterio_during_8_9_at_2003(Res) :- setof((Start,End),globally_world_heavyweight_championship_rey_mysterio_during_8_9(Start,End),AllINtervals), checkvalidity(2003,AllINtervals,Res).

check_query() :- write('Query = globally_world_heavyweight_championship_rey_mysterio_during_8_9_at_2003'), (globally_world_heavyweight_championship_rey_mysterio_during_8_9_at_2003(true) -> write('\nRes   = true');write('\nRes   = false')).

