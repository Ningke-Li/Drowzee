:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

ev_2010_11_la_liga(Start,End) :- begin('ev_2010_11_la_liga',_,_,Start), end('ev_2010_11_la_liga',_,_,End), Start=<End.

ev_3rd_millennium_last_till_8_12(Start,End) :- ev_3rd_millennium(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

ev_3rd_millennium_until_ev_2010_11_la_liga_during_8_12_overlap(Start,End) :- ev_3rd_millennium_last_till_8_12(Start1,End1), ev_2010_11_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_3rd_millennium_until_ev_2010_11_la_liga_during_8_12(Start,End) :- ev_3rd_millennium(W1,_), ev_3rd_millennium_until_ev_2010_11_la_liga_during_8_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-8), Start=<End.

ev_3rd_millennium_until_ev_2010_11_la_liga_during_8_12_at_1925(Res) :- setof((Start,End),ev_3rd_millennium_until_ev_2010_11_la_liga_during_8_12(Start,End),AllINtervals), checkvalidity(1925,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_until_ev_2010_11_la_liga_during_8_12_at_1925'), (ev_3rd_millennium_until_ev_2010_11_la_liga_during_8_12_at_1925(true) -> write('\nRes   = true');write('\nRes   = false')).

