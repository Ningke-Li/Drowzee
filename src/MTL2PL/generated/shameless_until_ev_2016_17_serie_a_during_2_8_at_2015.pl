:- include('database.pl').
shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

ev_2016_17_serie_a(Start,End) :- begin('ev_2016_17_serie_a',_,_,Start), end('ev_2016_17_serie_a',_,_,End), Start=<End.

shameless_last_till_2_8(Start,End) :- shameless(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

shameless_until_ev_2016_17_serie_a_during_2_8_overlap(Start,End) :- shameless_last_till_2_8(Start1,End1), ev_2016_17_serie_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

shameless_until_ev_2016_17_serie_a_during_2_8(Start,End) :- shameless(W1,_), shameless_until_ev_2016_17_serie_a_during_2_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-2), Start=<End.

shameless_until_ev_2016_17_serie_a_during_2_8_at_2015(Res) :- setof((Start,End),shameless_until_ev_2016_17_serie_a_during_2_8(Start,End),AllINtervals), checkvalidity(2015,AllINtervals,Res).

check_query() :- write('Query = shameless_until_ev_2016_17_serie_a_during_2_8_at_2015'), (shameless_until_ev_2016_17_serie_a_during_2_8_at_2015(true) -> write('\nRes   = true');write('\nRes   = false')).

