:- include('database.pl').
french_franc(Start,End) :- begin('french_franc',_,_,Start), end('french_franc',_,_,End), Start=<End.

ev_19th_century(Start,End) :- begin('ev_19th_century',_,_,Start), end('ev_19th_century',_,_,End), Start=<End.

french_franc_last_till_4_7(Start,End) :- french_franc(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

french_franc_until_ev_19th_century_during_4_7_overlap(Start,End) :- french_franc_last_till_4_7(Start1,End1), ev_19th_century(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

french_franc_until_ev_19th_century_during_4_7(Start,End) :- french_franc(W1,_), french_franc_until_ev_19th_century_during_4_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-4), Start=<End.

french_franc_until_ev_19th_century_during_4_7_at_1721(Res) :- setof((Start,End),french_franc_until_ev_19th_century_during_4_7(Start,End),AllINtervals), checkvalidity(1721,AllINtervals,Res).

check_query() :- write('Query = french_franc_until_ev_19th_century_during_4_7_at_1721'), (french_franc_until_ev_19th_century_during_4_7_at_1721(true) -> write('\nRes   = true');write('\nRes   = false')).

