:- include('database.pl').
vostok_programme(Start,End) :- begin('vostok_programme',_,_,Start), end('vostok_programme',_,_,End), Start=<End.

ev_21st_century(Start,End) :- begin('ev_21st_century',_,_,Start), end('ev_21st_century',_,_,End), Start=<End.

vostok_programme_last_till_21_29(Start,End) :- vostok_programme(Start1,End1), (End1-Start1)>=21, Start is (Start1+21), End is (End1+1).

vostok_programme_until_ev_21st_century_during_21_29_overlap(Start,End) :- vostok_programme_last_till_21_29(Start1,End1), ev_21st_century(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

vostok_programme_until_ev_21st_century_during_21_29(Start,End) :- vostok_programme(W1,_), vostok_programme_until_ev_21st_century_during_21_29_overlap(Start1,End1), Start is max((Start1-29),W1), End is (End1-21), Start=<End.

vostok_programme_until_ev_21st_century_during_21_29_at_1832(Res) :- setof((Start,End),vostok_programme_until_ev_21st_century_during_21_29(Start,End),AllINtervals), checkvalidity(1832,AllINtervals,Res).

check_query() :- write('Query = vostok_programme_until_ev_21st_century_during_21_29_at_1832'), (vostok_programme_until_ev_21st_century_during_21_29_at_1832(true) -> write('\nRes   = true');write('\nRes   = false')).

