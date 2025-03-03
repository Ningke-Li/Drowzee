:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

supergirl(Start,End) :- begin('supergirl',_,_,Start), end('supergirl',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_7_16(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

pasi_n_de_gavilanes_until_supergirl_during_7_16_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_7_16(Start1,End1), supergirl(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_supergirl_during_7_16(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_supergirl_during_7_16_overlap(Start1,End1), Start is max((Start1-16),W1), End is (End1-7), Start=<End.

pasi_n_de_gavilanes_until_supergirl_during_7_16_at_2011(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_supergirl_during_7_16(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_supergirl_during_7_16_at_2011'), (pasi_n_de_gavilanes_until_supergirl_during_7_16_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

