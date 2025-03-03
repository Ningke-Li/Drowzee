:- include('database.pl').
ev_1931_32_la_liga(Start,End) :- begin('ev_1931_32_la_liga',_,_,Start), end('ev_1931_32_la_liga',_,_,End), Start=<End.

finally_ev_1931_32_la_liga_during_6_12(Start,End) :- ev_1931_32_la_liga(Start1,End1), (Start1-12)=<(End1-6), Start is (Start1-12), End is (End1-6), Start=<End.

finally_ev_1931_32_la_liga_during_6_12_at_1885(Res) :- setof((Start,End),finally_ev_1931_32_la_liga_during_6_12(Start,End),AllINtervals), checkvalidity(1885,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1931_32_la_liga_during_6_12_at_1885'), (finally_ev_1931_32_la_liga_during_6_12_at_1885(true) -> write('\nRes   = true');write('\nRes   = false')).

