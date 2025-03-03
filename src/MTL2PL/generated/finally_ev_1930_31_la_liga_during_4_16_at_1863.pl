:- include('database.pl').
ev_1930_31_la_liga(Start,End) :- begin('ev_1930_31_la_liga',_,_,Start), end('ev_1930_31_la_liga',_,_,End), Start=<End.

finally_ev_1930_31_la_liga_during_4_16(Start,End) :- ev_1930_31_la_liga(Start1,End1), (Start1-16)=<(End1-4), Start is (Start1-16), End is (End1-4), Start=<End.

finally_ev_1930_31_la_liga_during_4_16_at_1863(Res) :- setof((Start,End),finally_ev_1930_31_la_liga_during_4_16(Start,End),AllINtervals), checkvalidity(1863,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1930_31_la_liga_during_4_16_at_1863'), (finally_ev_1930_31_la_liga_during_4_16_at_1863(true) -> write('\nRes   = true');write('\nRes   = false')).

