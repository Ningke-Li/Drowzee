:- include('database.pl').
ev_3rd_millennium(Start,End) :- begin('ev_3rd_millennium',_,_,Start), end('ev_3rd_millennium',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

ev_3rd_millennium_last_till_5_9(Start,End) :- ev_3rd_millennium(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

ev_3rd_millennium_until_kuroko_s_basketball_during_5_9_overlap(Start,End) :- ev_3rd_millennium_last_till_5_9(Start1,End1), kuroko_s_basketball(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

ev_3rd_millennium_until_kuroko_s_basketball_during_5_9(Start,End) :- ev_3rd_millennium(W1,_), ev_3rd_millennium_until_kuroko_s_basketball_during_5_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-5), Start=<End.

ev_3rd_millennium_until_kuroko_s_basketball_during_5_9_at_2007(Res) :- setof((Start,End),ev_3rd_millennium_until_kuroko_s_basketball_during_5_9(Start,End),AllINtervals), checkvalidity(2007,AllINtervals,Res).

check_query() :- write('Query = ev_3rd_millennium_until_kuroko_s_basketball_during_5_9_at_2007'), (ev_3rd_millennium_until_kuroko_s_basketball_during_5_9_at_2007(true) -> write('\nRes   = true');write('\nRes   = false')).

