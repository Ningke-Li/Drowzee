:- include('database.pl').
the_x_factor(Start,End) :- begin('the_x_factor',_,_,Start), end('the_x_factor',_,_,End), Start=<End.

ev_2015_16_serie_a(Start,End) :- begin('ev_2015_16_serie_a',_,_,Start), end('ev_2015_16_serie_a',_,_,End), Start=<End.

the_x_factor_last_till_3_7(Start,End) :- the_x_factor(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

the_x_factor_until_ev_2015_16_serie_a_during_3_7_overlap(Start,End) :- the_x_factor_last_till_3_7(Start1,End1), ev_2015_16_serie_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_x_factor_until_ev_2015_16_serie_a_during_3_7(Start,End) :- the_x_factor(W1,_), the_x_factor_until_ev_2015_16_serie_a_during_3_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-3), Start=<End.

the_x_factor_until_ev_2015_16_serie_a_during_3_7_at_1861(Res) :- setof((Start,End),the_x_factor_until_ev_2015_16_serie_a_during_3_7(Start,End),AllINtervals), checkvalidity(1861,AllINtervals,Res).

check_query() :- write('Query = the_x_factor_until_ev_2015_16_serie_a_during_3_7_at_1861'), (the_x_factor_until_ev_2015_16_serie_a_during_3_7_at_1861(true) -> write('\nRes   = true');write('\nRes   = false')).

