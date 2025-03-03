:- include('database.pl').
german_mark(Start,End) :- begin('german_mark',_,_,Start), end('german_mark',_,_,End), Start=<End.

ev_20th_century(Start,End) :- begin('ev_20th_century',_,_,Start), end('ev_20th_century',_,_,End), Start=<End.

german_mark_last_till_6_16(Start,End) :- german_mark(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

german_mark_until_ev_20th_century_during_6_16_overlap(Start,End) :- german_mark_last_till_6_16(Start1,End1), ev_20th_century(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

german_mark_until_ev_20th_century_during_6_16(Start,End) :- german_mark(W1,_), german_mark_until_ev_20th_century_during_6_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-6), Start=<End.

german_mark_until_ev_20th_century_during_6_16_at_1897(Res) :- setof((Start,End),german_mark_until_ev_20th_century_during_6_16(Start,End),AllINtervals), checkvalidity(1897,AllINtervals,Res).

check_query() :- write('Query = german_mark_until_ev_20th_century_during_6_16_at_1897'), (german_mark_until_ev_20th_century_during_6_16_at_1897(true) -> write('\nRes   = true');write('\nRes   = false')).

