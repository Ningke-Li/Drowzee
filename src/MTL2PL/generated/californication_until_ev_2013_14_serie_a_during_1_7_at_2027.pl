:- include('database.pl').
californication(Start,End) :- begin('californication',_,_,Start), end('californication',_,_,End), Start=<End.

ev_2013_14_serie_a(Start,End) :- begin('ev_2013_14_serie_a',_,_,Start), end('ev_2013_14_serie_a',_,_,End), Start=<End.

californication_last_till_1_7(Start,End) :- californication(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

californication_until_ev_2013_14_serie_a_during_1_7_overlap(Start,End) :- californication_last_till_1_7(Start1,End1), ev_2013_14_serie_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

californication_until_ev_2013_14_serie_a_during_1_7(Start,End) :- californication(W1,_), californication_until_ev_2013_14_serie_a_during_1_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-1), Start=<End.

californication_until_ev_2013_14_serie_a_during_1_7_at_2027(Res) :- setof((Start,End),californication_until_ev_2013_14_serie_a_during_1_7(Start,End),AllINtervals), checkvalidity(2027,AllINtervals,Res).

check_query() :- write('Query = californication_until_ev_2013_14_serie_a_during_1_7_at_2027'), (californication_until_ev_2013_14_serie_a_during_1_7_at_2027(true) -> write('\nRes   = true');write('\nRes   = false')).

