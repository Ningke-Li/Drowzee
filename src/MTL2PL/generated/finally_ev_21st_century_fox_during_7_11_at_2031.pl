:- include('database.pl').
ev_21st_century_fox(Start,End) :- begin('ev_21st_century_fox',_,_,Start), end('ev_21st_century_fox',_,_,End), Start=<End.

finally_ev_21st_century_fox_during_7_11(Start,End) :- ev_21st_century_fox(Start1,End1), (Start1-11)=<(End1-7), Start is (Start1-11), End is (End1-7), Start=<End.

finally_ev_21st_century_fox_during_7_11_at_2031(Res) :- setof((Start,End),finally_ev_21st_century_fox_during_7_11(Start,End),AllINtervals), checkvalidity(2031,AllINtervals,Res).

check_query() :- write('Query = finally_ev_21st_century_fox_during_7_11_at_2031'), (finally_ev_21st_century_fox_during_7_11_at_2031(true) -> write('\nRes   = true');write('\nRes   = false')).

