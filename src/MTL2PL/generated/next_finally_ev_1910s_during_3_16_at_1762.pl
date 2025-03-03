:- include('database.pl').
ev_1910s(Start,End) :- begin('ev_1910s',_,_,Start), end('ev_1910s',_,_,End), Start=<End.

finally_ev_1910s_during_3_16(Start,End) :- ev_1910s(Start1,End1), (Start1-16)=<(End1-3), Start is (Start1-16), End is (End1-3), Start=<End.

next_finally_ev_1910s_during_3_16(Start,End) :- finally_ev_1910s_during_3_16(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_finally_ev_1910s_during_3_16_at_1762(Res) :- setof((Start,End),next_finally_ev_1910s_during_3_16(Start,End),AllINtervals), checkvalidity(1762,AllINtervals,Res).

check_query() :- write('Query = next_finally_ev_1910s_during_3_16_at_1762'), (next_finally_ev_1910s_during_3_16_at_1762(true) -> write('\nRes   = true');write('\nRes   = false')).

