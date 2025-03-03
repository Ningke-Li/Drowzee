:- include('database.pl').
ev_1940s(Start,End) :- begin('ev_1940s',_,_,Start), end('ev_1940s',_,_,End), Start=<End.

globally_ev_1940s_during_2_8(Start,End) :- ev_1940s(Start1,End1), Start is (Start1-2), End is (End1-8), Start=<End.

globally_ev_1940s_during_2_8_at_1908(Res) :- setof((Start,End),globally_ev_1940s_during_2_8(Start,End),AllINtervals), checkvalidity(1908,AllINtervals,Res).

check_query() :- write('Query = globally_ev_1940s_during_2_8_at_1908'), (globally_ev_1940s_during_2_8_at_1908(true) -> write('\nRes   = true');write('\nRes   = false')).

