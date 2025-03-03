:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

homeland(Start,End) :- begin('homeland',_,_,Start), end('homeland',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_4_12(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

pasi_n_de_gavilanes_until_homeland_during_4_12_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_4_12(Start1,End1), homeland(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_homeland_during_4_12(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_homeland_during_4_12_overlap(Start1,End1), Start is max((Start1-12),W1), End is (End1-4), Start=<End.

pasi_n_de_gavilanes_until_homeland_during_4_12_at_2045(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_homeland_during_4_12(Start,End),AllINtervals), checkvalidity(2045,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_homeland_during_4_12_at_2045'), (pasi_n_de_gavilanes_until_homeland_during_4_12_at_2045(true) -> write('\nRes   = true');write('\nRes   = false')).

