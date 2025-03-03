:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

johnny_test(Start,End) :- begin('johnny_test',_,_,Start), end('johnny_test',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio_last_till_2_10(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

world_heavyweight_championship_rey_mysterio_until_johnny_test_during_2_10_overlap(Start,End) :- world_heavyweight_championship_rey_mysterio_last_till_2_10(Start1,End1), johnny_test(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

world_heavyweight_championship_rey_mysterio_until_johnny_test_during_2_10(Start,End) :- world_heavyweight_championship_rey_mysterio(W1,_), world_heavyweight_championship_rey_mysterio_until_johnny_test_during_2_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-2), Start=<End.

world_heavyweight_championship_rey_mysterio_until_johnny_test_during_2_10_at_1868(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_until_johnny_test_during_2_10(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_until_johnny_test_during_2_10_at_1868'), (world_heavyweight_championship_rey_mysterio_until_johnny_test_during_2_10_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).

