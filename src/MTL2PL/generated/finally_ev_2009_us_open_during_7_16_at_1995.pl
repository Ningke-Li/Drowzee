:- include('database.pl').
ev_2009_us_open(Start,End) :- begin('ev_2009_us_open',_,_,Start), end('ev_2009_us_open',_,_,End), Start=<End.

finally_ev_2009_us_open_during_7_16(Start,End) :- ev_2009_us_open(Start1,End1), (Start1-16)=<(End1-7), Start is (Start1-16), End is (End1-7), Start=<End.

finally_ev_2009_us_open_during_7_16_at_1995(Res) :- setof((Start,End),finally_ev_2009_us_open_during_7_16(Start,End),AllINtervals), checkvalidity(1995,AllINtervals,Res).

check_query() :- write('Query = finally_ev_2009_us_open_during_7_16_at_1995'), (finally_ev_2009_us_open_during_7_16_at_1995(true) -> write('\nRes   = true');write('\nRes   = false')).

