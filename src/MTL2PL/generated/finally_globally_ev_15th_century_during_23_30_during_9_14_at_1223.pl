:- include('database.pl').
ev_15th_century(Start,End) :- begin('ev_15th_century',_,_,Start), end('ev_15th_century',_,_,End), Start=<End.

globally_ev_15th_century_during_23_30(Start,End) :- ev_15th_century(Start1,End1), Start is (Start1-23), End is (End1-30), Start=<End.

finally_globally_ev_15th_century_during_23_30_during_9_14(Start,End) :- globally_ev_15th_century_during_23_30(Start1,End1), (Start1-14)=<(End1-9), Start is (Start1-14), End is (End1-9), Start=<End.

finally_globally_ev_15th_century_during_23_30_during_9_14_at_1223(Res) :- setof((Start,End),finally_globally_ev_15th_century_during_23_30_during_9_14(Start,End),AllINtervals), checkvalidity(1223,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ev_15th_century_during_23_30_during_9_14_at_1223'), (finally_globally_ev_15th_century_during_23_30_during_9_14_at_1223(true) -> write('\nRes   = true');write('\nRes   = false')).

