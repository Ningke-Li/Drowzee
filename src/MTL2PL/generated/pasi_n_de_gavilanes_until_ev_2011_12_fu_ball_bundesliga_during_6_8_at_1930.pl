:- include('database.pl').
pasi_n_de_gavilanes(Start,End) :- begin('pasi_n_de_gavilanes',_,_,Start), end('pasi_n_de_gavilanes',_,_,End), Start=<End.

ev_2011_12_fu_ball_bundesliga(Start,End) :- begin('ev_2011_12_fu_ball_bundesliga',_,_,Start), end('ev_2011_12_fu_ball_bundesliga',_,_,End), Start=<End.

pasi_n_de_gavilanes_last_till_6_8(Start,End) :- pasi_n_de_gavilanes(Start1,End1), (End1-Start1)>=6, Start is (Start1+6), End is (End1+1).

pasi_n_de_gavilanes_until_ev_2011_12_fu_ball_bundesliga_during_6_8_overlap(Start,End) :- pasi_n_de_gavilanes_last_till_6_8(Start1,End1), ev_2011_12_fu_ball_bundesliga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

pasi_n_de_gavilanes_until_ev_2011_12_fu_ball_bundesliga_during_6_8(Start,End) :- pasi_n_de_gavilanes(W1,_), pasi_n_de_gavilanes_until_ev_2011_12_fu_ball_bundesliga_during_6_8_overlap(Start1,End1), Start is max((Start1-8),W1), End is (End1-6), Start=<End.

pasi_n_de_gavilanes_until_ev_2011_12_fu_ball_bundesliga_during_6_8_at_1930(Res) :- setof((Start,End),pasi_n_de_gavilanes_until_ev_2011_12_fu_ball_bundesliga_during_6_8(Start,End),AllINtervals), checkvalidity(1930,AllINtervals,Res).

check_query() :- write('Query = pasi_n_de_gavilanes_until_ev_2011_12_fu_ball_bundesliga_during_6_8_at_1930'), (pasi_n_de_gavilanes_until_ev_2011_12_fu_ball_bundesliga_during_6_8_at_1930(true) -> write('\nRes   = true');write('\nRes   = false')).

