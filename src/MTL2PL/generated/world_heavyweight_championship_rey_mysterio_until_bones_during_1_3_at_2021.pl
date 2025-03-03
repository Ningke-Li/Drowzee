:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

bones(Start,End) :- begin('bones',_,_,Start), end('bones',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio_last_till_1_3(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

world_heavyweight_championship_rey_mysterio_until_bones_during_1_3_overlap(Start,End) :- world_heavyweight_championship_rey_mysterio_last_till_1_3(Start1,End1), bones(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

world_heavyweight_championship_rey_mysterio_until_bones_during_1_3(Start,End) :- world_heavyweight_championship_rey_mysterio(W1,_), world_heavyweight_championship_rey_mysterio_until_bones_during_1_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-1), Start=<End.

world_heavyweight_championship_rey_mysterio_until_bones_during_1_3_at_2021(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_until_bones_during_1_3(Start,End),AllINtervals), checkvalidity(2021,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_until_bones_during_1_3_at_2021'), (world_heavyweight_championship_rey_mysterio_until_bones_during_1_3_at_2021(true) -> write('\nRes   = true');write('\nRes   = false')).

