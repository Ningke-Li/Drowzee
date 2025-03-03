:- include('database.pl').
ottoman_greece(Start,End) :- begin('ottoman_greece',_,_,Start), end('ottoman_greece',_,_,End), Start=<End.

ev_17th_century(Start,End) :- begin('ev_17th_century',_,_,Start), end('ev_17th_century',_,_,End), Start=<End.

ottoman_greece_last_till_9_18(Start,End) :- ottoman_greece(Start1,End1), (End1-Start1)>=9, Start is (Start1+9), End is (End1+1).

ottoman_greece_until_ev_17th_century_during_9_18_overlap(Start,End) :- ottoman_greece_last_till_9_18(Start1,End1), ev_17th_century(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ottoman_greece_until_ev_17th_century_during_9_18(Start,End) :- ottoman_greece(W1,_), ottoman_greece_until_ev_17th_century_during_9_18_overlap(Start1,End1), Start is max((Start1-18),W1), End is (End1-9), Start=<End.

ottoman_greece_until_ev_17th_century_during_9_18_at_1579(Res) :- setof((Start,End),ottoman_greece_until_ev_17th_century_during_9_18(Start,End),AllINtervals), checkvalidity(1579,AllINtervals,Res).

check_query() :- write('Query = ottoman_greece_until_ev_17th_century_during_9_18_at_1579'), (ottoman_greece_until_ev_17th_century_during_9_18_at_1579(true) -> write('\nRes   = true');write('\nRes   = false')).

