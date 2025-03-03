:- include('database.pl').
ev_15th_century(Start,End) :- begin('ev_15th_century',_,_,Start), end('ev_15th_century',_,_,End), Start=<End.

finally_ev_15th_century_during_1_18(Start,End) :- ev_15th_century(Start1,End1), (Start1-18)=<(End1-1), Start is (Start1-18), End is (End1-1), Start=<End.

finally_ev_15th_century_during_1_18_at_1451(Res) :- setof((Start,End),finally_ev_15th_century_during_1_18(Start,End),AllINtervals), checkvalidity(1451,AllINtervals,Res).

check_query() :- write('Query = finally_ev_15th_century_during_1_18_at_1451'), (finally_ev_15th_century_during_1_18_at_1451(true) -> write('\nRes   = true');write('\nRes   = false')).

