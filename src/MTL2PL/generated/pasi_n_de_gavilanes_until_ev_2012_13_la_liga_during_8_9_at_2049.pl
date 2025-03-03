:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_8_9(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=8, Start is (Start1+8), End is (End1+1).

pasi_n_de_gavilanes_until_ev_2012_13_la_liga_during_8_9_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_8_9(Start1,End1), ev_2012_13_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_ev_2012_13_la_liga_during_8_9(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_ev_2012_13_la_liga_during_8_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-8), Start=<End.

pasi_n_de_gavilanes_until_ev_2012_13_la_liga_during_8_9_at_2049(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_ev_2012_13_la_liga_during_8_9(Start,End),AllINtervals), checkvalidity(2049,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_ev_2012_13_la_liga_during_8_9_at_2049'), (pasi_n_de_gavilanes_until_ev_2012_13_la_liga_during_8_9_at_2049(true) -> write('\nRes   = true');write('\nRes   = false')).

