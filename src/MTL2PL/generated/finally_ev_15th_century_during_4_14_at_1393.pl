:- include('database.pl').
ev_15th_century(Start,End) :- begin('ev_15th_century',_,_,Start), end('ev_15th_century',_,_,End), Start=<End.

finally_ev_15th_century_during_4_14(Start,End) :- ev_15th_century(Start1,End1), (Start1-14)=<(End1-4), Start is (Start1-14), End is (End1-4), Start=<End.

finally_ev_15th_century_during_4_14_at_1393(Res) :- setof((Start,End),finally_ev_15th_century_during_4_14(Start,End),AllINtervals), checkvalidity(1393,AllINtervals,Res).

check_query() :- write('Query = finally_ev_15th_century_during_4_14_at_1393'), (finally_ev_15th_century_during_4_14_at_1393(true) -> write('\nRes   = true');write('\nRes   = false')).

