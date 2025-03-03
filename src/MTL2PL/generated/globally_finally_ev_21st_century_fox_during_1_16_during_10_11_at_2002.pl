:- include('database.pl').
ev_21st_century_fox(Start,End) :- begin('ev_21st_century_fox',_,_,Start), end('ev_21st_century_fox',_,_,End), Start=<End.

finally_ev_21st_century_fox_during_1_16(Start,End) :- ev_21st_century_fox(Start1,End1), (Start1-16)=<(End1-1), Start is (Start1-16), End is (End1-1), Start=<End.

globally_finally_ev_21st_century_fox_during_1_16_during_10_11(Start,End) :- finally_ev_21st_century_fox_during_1_16(Start1,End1), Start is (Start1-10), End is (End1-11), Start=<End.

globally_finally_ev_21st_century_fox_during_1_16_during_10_11_at_2002(Res) :- setof((Start,End),globally_finally_ev_21st_century_fox_during_1_16_during_10_11(Start,End),AllINtervals), checkvalidity(2002,AllINtervals,Res).

check_query() :- write('Query = globally_finally_ev_21st_century_fox_during_1_16_during_10_11_at_2002'), (globally_finally_ev_21st_century_fox_during_1_16_during_10_11_at_2002(true) -> write('\nRes   = true');write('\nRes   = false')).

