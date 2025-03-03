:- include('database.pl').
annoying_orange(Start,End) :- begin('annoying_orange',_,_,Start), end('annoying_orange',_,_,End), Start=<End.

ev_2012_13_serie_a(Start,End) :- begin('ev_2012_13_serie_a',_,_,Start), end('ev_2012_13_serie_a',_,_,End), Start=<End.

annoying_orange_last_till_1_9(Start,End) :- annoying_orange(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

annoying_orange_until_ev_2012_13_serie_a_during_1_9_overlap(Start,End) :- annoying_orange_last_till_1_9(Start1,End1), ev_2012_13_serie_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

annoying_orange_until_ev_2012_13_serie_a_during_1_9(Start,End) :- annoying_orange(W1,_), annoying_orange_until_ev_2012_13_serie_a_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

annoying_orange_until_ev_2012_13_serie_a_during_1_9_at_2011(Res) :- setof((Start,End),annoying_orange_until_ev_2012_13_serie_a_during_1_9(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = annoying_orange_until_ev_2012_13_serie_a_during_1_9_at_2011'), (annoying_orange_until_ev_2012_13_serie_a_during_1_9_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

