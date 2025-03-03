:- include('database.pl').
lithuanian_litas(Start,End) :- begin('lithuanian_litas',_,_,Start), end('lithuanian_litas',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

lithuanian_litas_last_till_1_4(Start,End) :- lithuanian_litas(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

lithuanian_litas_until_kuroko_s_basketball_during_1_4_overlap(Start,End) :- lithuanian_litas_last_till_1_4(Start1,End1), kuroko_s_basketball(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

lithuanian_litas_until_kuroko_s_basketball_during_1_4(Start,End) :- lithuanian_litas(W1,_), lithuanian_litas_until_kuroko_s_basketball_during_1_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-1), Start=<End.

lithuanian_litas_until_kuroko_s_basketball_during_1_4_at_1962(Res) :- setof((Start,End),lithuanian_litas_until_kuroko_s_basketball_during_1_4(Start,End),AllINtervals), checkvalidity(1962,AllINtervals,Res).

check_query() :- write('Query = lithuanian_litas_until_kuroko_s_basketball_during_1_4_at_1962'), (lithuanian_litas_until_kuroko_s_basketball_during_1_4_at_1962(true) -> write('\nRes   = true');write('\nRes   = false')).

