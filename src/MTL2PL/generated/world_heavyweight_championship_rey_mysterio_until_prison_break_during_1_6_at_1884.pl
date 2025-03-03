:- include('database.pl').
world_heavyweight_championship_rey_mysterio(Start,End) :- begin('world_heavyweight_championship_rey_mysterio',_,_,Start), end('world_heavyweight_championship_rey_mysterio',_,_,End), Start=<End.

prison_break(Start,End) :- begin('prison_break',_,_,Start), end('prison_break',_,_,End), Start=<End.

world_heavyweight_championship_rey_mysterio_last_till_1_6(Start,End) :- world_heavyweight_championship_rey_mysterio(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

world_heavyweight_championship_rey_mysterio_until_prison_break_during_1_6_overlap(Start,End) :- world_heavyweight_championship_rey_mysterio_last_till_1_6(Start1,End1), prison_break(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

world_heavyweight_championship_rey_mysterio_until_prison_break_during_1_6(Start,End) :- world_heavyweight_championship_rey_mysterio(W1,_), world_heavyweight_championship_rey_mysterio_until_prison_break_during_1_6_overlap(Start1,End1), Start is max((Start1-6),W1), End is (End1-1), Start=<End.

world_heavyweight_championship_rey_mysterio_until_prison_break_during_1_6_at_1884(Res) :- setof((Start,End),world_heavyweight_championship_rey_mysterio_until_prison_break_during_1_6(Start,End),AllINtervals), checkvalidity(1884,AllINtervals,Res).

check_query() :- write('Query = world_heavyweight_championship_rey_mysterio_until_prison_break_during_1_6_at_1884'), (world_heavyweight_championship_rey_mysterio_until_prison_break_during_1_6_at_1884(true) -> write('\nRes   = true');write('\nRes   = false')).

