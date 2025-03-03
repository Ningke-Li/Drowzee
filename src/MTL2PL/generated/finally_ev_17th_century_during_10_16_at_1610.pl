:- include('database.pl').
ev_17th_century(Start,End) :- begin('ev_17th_century',_,_,Start), end('ev_17th_century',_,_,End), Start=<End.

finally_ev_17th_century_during_10_16(Start,End) :- ev_17th_century(Start1,End1), (Start1-16)=<(End1-10), Start is (Start1-16), End is (End1-10), Start=<End.

finally_ev_17th_century_during_10_16_at_1610(Res) :- setof((Start,End),finally_ev_17th_century_during_10_16(Start,End),AllINtervals), checkvalidity(1610,AllINtervals,Res).

check_query() :- write('Query = finally_ev_17th_century_during_10_16_at_1610'), (finally_ev_17th_century_during_10_16_at_1610(true) -> write('\nRes   = true');write('\nRes   = false')).

