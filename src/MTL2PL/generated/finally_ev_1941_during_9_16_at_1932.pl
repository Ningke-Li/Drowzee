:- include('database.pl').
ev_1941(Start,End) :- begin('ev_1941',_,_,Start), end('ev_1941',_,_,End), Start=<End.

finally_ev_1941_during_9_16(Start,End) :- ev_1941(Start1,End1), (Start1-16)=<(End1-9), Start is (Start1-16), End is (End1-9), Start=<End.

finally_ev_1941_during_9_16_at_1932(Res) :- setof((Start,End),finally_ev_1941_during_9_16(Start,End),AllINtervals), checkvalidity(1932,AllINtervals,Res).

check_query() :- write('Query = finally_ev_1941_during_9_16_at_1932'), (finally_ev_1941_during_9_16_at_1932(true) -> write('\nRes   = true');write('\nRes   = false')).

