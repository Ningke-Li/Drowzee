:- include('database.pl').
ev_19th_century(Start,End) :- begin('ev_19th_century',_,_,Start), end('ev_19th_century',_,_,End), Start=<End.

finally_ev_19th_century_during_2_13(Start,End) :- ev_19th_century(Start1,End1), (Start1-13)=<(End1-2), Start is (Start1-13), End is (End1-2), Start=<End.

finally_ev_19th_century_during_2_13_at_1898(Res) :- setof((Start,End),finally_ev_19th_century_during_2_13(Start,End),AllINtervals), checkvalidity(1898,AllINtervals,Res).

check_query() :- write('Query = finally_ev_19th_century_during_2_13_at_1898'), (finally_ev_19th_century_during_2_13_at_1898(true) -> write('\nRes   = true');write('\nRes   = false')).

