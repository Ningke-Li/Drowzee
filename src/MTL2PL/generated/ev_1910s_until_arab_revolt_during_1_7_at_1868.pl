:- include('database.pl').
ev_1910s(Start,End) :- begin('ev_1910s',_,_,Start), end('ev_1910s',_,_,End), Start=<End.

arab_revolt(Start,End) :- begin('arab_revolt',_,_,Start), end('arab_revolt',_,_,End), Start=<End.

ev_1910s_last_till_1_7(Start,End) :- ev_1910s(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

ev_1910s_until_arab_revolt_during_1_7_overlap(Start,End) :- ev_1910s_last_till_1_7(Start1,End1), arab_revolt(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_1910s_until_arab_revolt_during_1_7(Start,End) :- ev_1910s(W1,_), ev_1910s_until_arab_revolt_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

ev_1910s_until_arab_revolt_during_1_7_at_1868(Res) :- setof((Start,End),ev_1910s_until_arab_revolt_during_1_7(Start,End),AllINtervals), checkvalidity(1868,AllINtervals,Res).

check_query() :- write('Query = ev_1910s_until_arab_revolt_during_1_7_at_1868'), (ev_1910s_until_arab_revolt_during_1_7_at_1868(true) -> write('\nRes   = true');write('\nRes   = false')).

