:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

sherlock(Start,End) :- begin('sherlock',_,_,Start), end('sherlock',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_3_12(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

pasi_n_de_gavilanes_until_sherlock_during_3_12_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_3_12(Start1,End1), sherlock(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_sherlock_during_3_12(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_sherlock_during_3_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-3), Start=<End.

pasi_n_de_gavilanes_until_sherlock_during_3_12_at_2017(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_sherlock_during_3_12(Start,End),AllINtervals), checkvalidity(2017,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_sherlock_during_3_12_at_2017'), (pasi_n_de_gavilanes_until_sherlock_during_3_12_at_2017(true) -> write('\nRes   = true');write('\nRes   = false')).

