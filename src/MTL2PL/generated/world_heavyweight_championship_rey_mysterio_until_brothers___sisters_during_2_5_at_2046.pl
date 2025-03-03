:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

brothers___sisters(Start,End) :- begin('brothers___sisters',_,_,Start), end('brothers___sisters',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio_last_till_2_5(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

world_heavyweight_championship_rey_mysterio_until_brothers___sisters_during_2_5_overlap(Start,End) :- world_heavyweight_championship_rey_mysterio_last_till_2_5(Start1,End1), brothers___sisters(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

world_heavyweight_championship_rey_mysterio_until_brothers___sisters_during_2_5(Start,End) :- world_heavyweight_championship_rey_mysterio(W1,_), world_heavyweight_championship_rey_mysterio_until_brothers___sisters_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

world_heavyweight_championship_rey_mysterio_until_brothers___sisters_during_2_5_at_2046(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_until_brothers___sisters_during_2_5(Start,End),AllINtervals), checkvalidity(2046,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_until_brothers___sisters_during_2_5_at_2046'), (world_heavyweight_championship_rey_mysterio_until_brothers___sisters_during_2_5_at_2046(true) -> write('\nRes   = true');write('\nRes   = false')).

