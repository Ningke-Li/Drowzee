:- include('database.pl').
ev_1950s(Start,End) :- begin('ev_1950s',_,_,Start), end('ev_1950s',_,_,End), Start=<End.

globally_ev_1950s_during_4_8(Start,End) :- ev_1950s(Start1,End1), Start is (Start1-4), End is (End1-8), Start=<End.

globally_ev_1950s_during_4_8_at_1796(Res) :- setof((Start,End),globally_ev_1950s_during_4_8(Start,End),AllINtervals), checkvalidity(1796,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1950s_during_4_8_at_1796'), (globally_ev_1950s_during_4_8_at_1796(true) -> write('\nRes   = true');write('\nRes   = false')).

