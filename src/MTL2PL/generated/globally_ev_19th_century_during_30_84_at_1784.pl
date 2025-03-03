:- include('database.pl').
ev_19th_century(Start,End) :- begin('ev_19th_century',_,_,Start), end('ev_19th_century',_,_,End), Start=<End.

globally_ev_19th_century_during_30_84(Start,End) :- ev_19th_century(Start1,End1), Start is (Start1-30), End is (End1-84), Start=<End.

globally_ev_19th_century_during_30_84_at_1784(Res) :- setof((Start,End),globally_ev_19th_century_during_30_84(Start,End),AllINtervals), checkvalidity(1784,AllINtervals,Res).

check_query() :- write('Query = globally_ev_19th_century_during_30_84_at_1784'), (globally_ev_19th_century_during_30_84_at_1784(true) -> write('\nRes   = true');write('\nRes   = false')).

