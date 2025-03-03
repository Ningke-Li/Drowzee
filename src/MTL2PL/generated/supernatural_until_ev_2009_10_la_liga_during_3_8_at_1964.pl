:- include('database.pl').
supernatural(Start,End) :- begin('supernatural',_,_,Start), end('supernatural',_,_,End), Start=<End.

ev_2009_10_la_liga(Start,End) :- begin('ev_2009_10_la_liga',_,_,Start), end('ev_2009_10_la_liga',_,_,End), Start=<End.

supernatural_last_till_3_8(Start,End) :- supernatural(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

supernatural_until_ev_2009_10_la_liga_during_3_8_overlap(Start,End) :- supernatural_last_till_3_8(Start1,End1), ev_2009_10_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

supernatural_until_ev_2009_10_la_liga_during_3_8(Start,End) :- supernatural(W1,_), supernatural_until_ev_2009_10_la_liga_during_3_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-3), Start=<End.

supernatural_until_ev_2009_10_la_liga_during_3_8_at_1964(Res) :- setof((Start,End),supernatural_until_ev_2009_10_la_liga_during_3_8(Start,End),AllINtervals), checkvalidity(1964,AllINtervals,Res).

check_query() :- write('Query = supernatural_until_ev_2009_10_la_liga_during_3_8_at_1964'), (supernatural_until_ev_2009_10_la_liga_during_3_8_at_1964(true) -> write('\nRes   = true');write('\nRes   = false')).

