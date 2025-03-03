:- include('database.pl').
ev_2015_copa_am_rica(Start,End) :- begin('ev_2015_copa_am_rica',_,_,Start), end('ev_2015_copa_am_rica',_,_,End), Start=<End.

finally_ev_2015_copa_am_rica_during_8_16(Start,End) :- ev_2015_copa_am_rica(Start1,End1), (Start1-16)=<(End1-8), Start is (Start1-16), End is (End1-8), Start=<End.

finally_ev_2015_copa_am_rica_during_8_16_at_1883(Res) :- setof((Start,End),finally_ev_2015_copa_am_rica_during_8_16(Start,End),AllINtervals), checkvalidity(1883,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2015_copa_am_rica_during_8_16_at_1883'), (finally_ev_2015_copa_am_rica_during_8_16_at_1883(true) -> write('\nRes   = true');write('\nRes   = false')).

