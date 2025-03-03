:- include('database.pl').
ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

globally_ev_21st_century_during_75_85(Start,End) :- ev_21st_century(Start1,End1), Start is (Start1-75), End is (End1-85), Start=<End.

finally_globally_ev_21st_century_during_75_85_during_5_20(Start,End) :- globally_ev_21st_century_during_75_85(Start1,End1), (Start1-20)=<(End1-5), Start is (Start1-20), End is (End1-5), Start=<End.

finally_globally_ev_21st_century_during_75_85_during_5_20_at_2004(Res) :- setof((Start,End),finally_globally_ev_21st_century_during_75_85_during_5_20(Start,End),AllINtervals), checkvalidity(2004,AllINtervals,Res).

check_query() :- write('Query = finally_globally_ev_21st_century_during_75_85_during_5_20_at_2004'), (finally_globally_ev_21st_century_during_75_85_during_5_20_at_2004(true) -> write('\nRes   = true');write('\nRes   = false')).

