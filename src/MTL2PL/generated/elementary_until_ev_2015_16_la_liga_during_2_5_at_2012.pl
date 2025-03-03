:- include('database.pl').
elementary(Start,End) :- begin('elementary',_,_,Start), end('elementary',_,_,End), Start=<End.

ev_2015_16_la_liga(Start,End) :- begin('ev_2015_16_la_liga',_,_,Start), end('ev_2015_16_la_liga',_,_,End), Start=<End.

elementary_last_till_2_5(Start,End) :- elementary(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

elementary_until_ev_2015_16_la_liga_during_2_5_overlap(Start,End) :- elementary_last_till_2_5(Start1,End1), ev_2015_16_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

elementary_until_ev_2015_16_la_liga_during_2_5(Start,End) :- elementary(W1,_), elementary_until_ev_2015_16_la_liga_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

elementary_until_ev_2015_16_la_liga_during_2_5_at_2012(Res) :- setof((Start,End),elementary_until_ev_2015_16_la_liga_during_2_5(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = elementary_until_ev_2015_16_la_liga_during_2_5_at_2012'), (elementary_until_ev_2015_16_la_liga_during_2_5_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

