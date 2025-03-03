:- include('database.pl').
mr__bean(Start,End) :- begin('mr__bean',_,_,Start), end('mr__bean',_,_,End), Start=<End.

ev_2015_16_serie_a(Start,End) :- begin('ev_2015_16_serie_a',_,_,Start), end('ev_2015_16_serie_a',_,_,End), Start=<End.

mr__bean_last_till_2_5(Start,End) :- mr__bean(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

mr__bean_until_ev_2015_16_serie_a_during_2_5_overlap(Start,End) :- mr__bean_last_till_2_5(Start1,End1), ev_2015_16_serie_a(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

mr__bean_until_ev_2015_16_serie_a_during_2_5(Start,End) :- mr__bean(W1,_), mr__bean_until_ev_2015_16_serie_a_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

mr__bean_until_ev_2015_16_serie_a_during_2_5_at_2022(Res) :- setof((Start,End),mr__bean_until_ev_2015_16_serie_a_during_2_5(Start,End),AllINtervals), checkvalidity(2022,AllINtervals,Res).

check_query() :- write('Query = mr__bean_until_ev_2015_16_serie_a_during_2_5_at_2022'), (mr__bean_until_ev_2015_16_serie_a_during_2_5_at_2022(true) -> write('\nRes   = true');write('\nRes   = false')).

