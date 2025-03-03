:- include('database.pl').
ev_21st_century_fox(Start,End) :- begin('ev_21st_century_fox',_,_,Start), end('ev_21st_century_fox',_,_,End), Start=<End.

globally_ev_21st_century_fox_during_4_5(Start,End) :- ev_21st_century_fox(Start1,End1), Start is (Start1-4), End is (End1-5), Start=<End.

globally_ev_21st_century_fox_during_4_5_at_2012(Res) :- setof((Start,End),globally_ev_21st_century_fox_during_4_5(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = globally_ev_21st_century_fox_during_4_5_at_2012'), (globally_ev_21st_century_fox_during_4_5_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

