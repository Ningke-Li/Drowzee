:- include('database.pl').
iraq_war(Start,End) :- begin('iraq_war',_,_,Start), end('iraq_war',_,_,End), Start=<End.

kuroko_s_basketball(Start,End) :- begin('kuroko_s_basketball',_,_,Start), end('kuroko_s_basketball',_,_,End), Start=<End.

iraq_war_last_till_3_13(Start,End) :- iraq_war(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

iraq_war_until_kuroko_s_basketball_during_3_13_overlap(Start,End) :- iraq_war_last_till_3_13(Start1,End1), kuroko_s_basketball(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

iraq_war_until_kuroko_s_basketball_during_3_13(Start,End) :- iraq_war(W1,_), iraq_war_until_kuroko_s_basketball_during_3_13_overlap(Start1,End1), Start is max((Start1-13),W1), End is (End1-3), Start=<End.

iraq_war_until_kuroko_s_basketball_during_3_13_at_1979(Res) :- setof((Start,End),iraq_war_until_kuroko_s_basketball_during_3_13(Start,End),AllINtervals), checkvalidity(1979,AllINtervals,Res).

check_query() :- write('Query = iraq_war_until_kuroko_s_basketball_during_3_13_at_1979'), (iraq_war_until_kuroko_s_basketball_during_3_13_at_1979(true) -> write('\nRes   = true');write('\nRes   = false')).

