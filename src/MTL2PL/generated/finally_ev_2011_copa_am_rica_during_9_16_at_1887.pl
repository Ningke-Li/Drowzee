:- include('database.pl').
ev_2011_copa_am_rica(Start,End) :- begin('ev_2011_copa_am_rica',_,_,Start), end('ev_2011_copa_am_rica',_,_,End), Start=<End.

finally_ev_2011_copa_am_rica_during_9_16(Start,End) :- ev_2011_copa_am_rica(Start1,End1), (Start1-16)=<(End1-9), Start is (Start1-16), End is (End1-9), Start=<End.

finally_ev_2011_copa_am_rica_during_9_16_at_1887(Res) :- setof((Start,End),finally_ev_2011_copa_am_rica_during_9_16(Start,End),AllINtervals), checkvalidity(1887,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2011_copa_am_rica_during_9_16_at_1887'), (finally_ev_2011_copa_am_rica_during_9_16_at_1887(true) -> write('\nRes   = true');write('\nRes   = false')).

