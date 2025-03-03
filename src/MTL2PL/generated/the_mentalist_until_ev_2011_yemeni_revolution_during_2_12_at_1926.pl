:- include('database.pl').
the_mentalist(Start,End) :- begin('the_mentalist',_,_,Start), end('the_mentalist',_,_,End), Start=<End.

ev_2011_yemeni_revolution(Start,End) :- begin('ev_2011_yemeni_revolution',_,_,Start), end('ev_2011_yemeni_revolution',_,_,End), Start=<End.

the_mentalist_last_till_2_12(Start,End) :- the_mentalist(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

the_mentalist_until_ev_2011_yemeni_revolution_during_2_12_overlap(Start,End) :- the_mentalist_last_till_2_12(Start1,End1), ev_2011_yemeni_revolution(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

the_mentalist_until_ev_2011_yemeni_revolution_during_2_12(Start,End) :- the_mentalist(W1,_), the_mentalist_until_ev_2011_yemeni_revolution_during_2_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-2), Start=<End.

the_mentalist_until_ev_2011_yemeni_revolution_during_2_12_at_1926(Res) :- setof((Start,End),the_mentalist_until_ev_2011_yemeni_revolution_during_2_12(Start,End),AllINtervals), checkvalidity(1926,AllINtervals,Res).

check_query() :- write('Query = the_mentalist_until_ev_2011_yemeni_revolution_during_2_12_at_1926'), (the_mentalist_until_ev_2011_yemeni_revolution_during_2_12_at_1926(true) -> write('\nRes   = true');write('\nRes   = false')).

