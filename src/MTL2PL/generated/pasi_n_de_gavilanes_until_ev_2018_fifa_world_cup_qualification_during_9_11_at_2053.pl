:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

ev_2018_fifa_world_cup_qualification(Start,End) :- begin('ev_2018_fifa_world_cup_qualification',_,_,Start), end('ev_2018_fifa_world_cup_qualification',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_9_11(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=9, Start is (Start1+9), End is (End1+1).

pasi_n_de_gavilanes_until_ev_2018_fifa_world_cup_qualification_during_9_11_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_9_11(Start1,End1), ev_2018_fifa_world_cup_qualification(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_ev_2018_fifa_world_cup_qualification_during_9_11(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_ev_2018_fifa_world_cup_qualification_during_9_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-9), Start=<End.

pasi_n_de_gavilanes_until_ev_2018_fifa_world_cup_qualification_during_9_11_at_2053(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_ev_2018_fifa_world_cup_qualification_during_9_11(Start,End),AllINtervals), checkvalidity(2053,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_ev_2018_fifa_world_cup_qualification_during_9_11_at_2053'), (pasi_n_de_gavilanes_until_ev_2018_fifa_world_cup_qualification_during_9_11_at_2053(true) -> write('\nRes   = true');write('\nRes   = false')).

