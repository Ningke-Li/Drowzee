:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

ev_2012_13_premier_league(Start,End) :- begin('ev_2012_13_premier_league',_,_,Start), end('ev_2012_13_premier_league',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_3_9(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

pasi_n_de_gavilanes_until_ev_2012_13_premier_league_during_3_9_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_3_9(Start1,End1), ev_2012_13_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_ev_2012_13_premier_league_during_3_9(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_ev_2012_13_premier_league_during_3_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-3), Start=<End.

pasi_n_de_gavilanes_until_ev_2012_13_premier_league_during_3_9_at_2006(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_ev_2012_13_premier_league_during_3_9(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_ev_2012_13_premier_league_during_3_9_at_2006'), (pasi_n_de_gavilanes_until_ev_2012_13_premier_league_during_3_9_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

