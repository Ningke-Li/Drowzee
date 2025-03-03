:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

medcezir(Start,End) :- begin('medcezir',_,_,Start), end('medcezir',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_1_8(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

pasi_n_de_gavilanes_until_medcezir_during_1_8_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_1_8(Start1,End1), medcezir(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_medcezir_during_1_8(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_medcezir_during_1_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-1), Start=<End.

pasi_n_de_gavilanes_until_medcezir_during_1_8_at_2063(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_medcezir_during_1_8(Start,End),AllINtervals), checkvalidity(2063,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_medcezir_during_1_8_at_2063'), (pasi_n_de_gavilanes_until_medcezir_during_1_8_at_2063(true) -> write('\nRes   = true');write('\nRes   = false')).

