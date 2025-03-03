:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

ben_10__ultimate_alien(Start,End) :- begin('ben_10__ultimate_alien',_,_,Start), end('ben_10__ultimate_alien',_,_,End), Start=<End.

ev_3rd_millennium_last_till_5_15(Start,End) :- ev_3rd_millennium(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

ev_3rd_millennium_until_ben_10__ultimate_alien_during_5_15_overlap(Start,End) :- ev_3rd_millennium_last_till_5_15(Start1,End1), ben_10__ultimate_alien(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_3rd_millennium_until_ben_10__ultimate_alien_during_5_15(Start,End) :- ev_3rd_millennium(W1,_), ev_3rd_millennium_until_ben_10__ultimate_alien_during_5_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-5), Start=<End.

ev_3rd_millennium_until_ben_10__ultimate_alien_during_5_15_at_1912(Res) :- setof((Start,End),ev_3rd_millennium_until_ben_10__ultimate_alien_during_5_15(Start,End),AllINtervals), checkvalidity(1912,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_until_ben_10__ultimate_alien_during_5_15_at_1912'), (ev_3rd_millennium_until_ben_10__ultimate_alien_during_5_15_at_1912(true) -> write('\nRes   = true');write('\nRes   = false')).

