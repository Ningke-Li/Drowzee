:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

ev_2010s(Start,End) :- begin('ev_2010s',_,_,Start), end('ev_2010s',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio_last_till_3_10(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

world_heavyweight_championship_rey_mysterio_until_ev_2010s_during_3_10_overlap(Start,End) :- world_heavyweight_championship_rey_mysterio_last_till_3_10(Start1,End1), ev_2010s(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

world_heavyweight_championship_rey_mysterio_until_ev_2010s_during_3_10(Start,End) :- world_heavyweight_championship_rey_mysterio(W1,_), world_heavyweight_championship_rey_mysterio_until_ev_2010s_during_3_10_overlap(Start1,End1), Start is max((Start1-10),W1), End is (End1-3), Start=<End.

world_heavyweight_championship_rey_mysterio_until_ev_2010s_during_3_10_at_1859(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_until_ev_2010s_during_3_10(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_until_ev_2010s_during_3_10_at_1859'), (world_heavyweight_championship_rey_mysterio_until_ev_2010s_during_3_10_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

