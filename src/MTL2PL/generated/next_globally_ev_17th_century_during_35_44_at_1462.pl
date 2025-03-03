:- include('database.pl').
ev_17th_century(Start,End) :- begin('ev_17th_century',_,_,Start), end('ev_17th_century',_,_,End), Start=<End.

globally_ev_17th_century_during_35_44(Start,End) :- ev_17th_century(Start1,End1), Start is (Start1-35), End is (End1-44), Start=<End.

next_globally_ev_17th_century_during_35_44(Start,End) :- globally_ev_17th_century_during_35_44(Start1,End1), Start is (Start1-1), End is (End1-1), Start=<End.

next_globally_ev_17th_century_during_35_44_at_1462(Res) :- setof((Start,End),next_globally_ev_17th_century_during_35_44(Start,End),AllINtervals), checkvalidity(1462,AllINtervals,Res).

check_query() :- write('Query = next_globally_ev_17th_century_during_35_44_at_1462'), (next_globally_ev_17th_century_during_35_44_at_1462(true) -> write('\nRes   = true');write('\nRes   = false')).

