:- include('database.pl').
merlin(Start,End) :- begin('merlin',_,_,Start), end('merlin',_,_,End), Start=<End.

ev_2011_12_la_liga(Start,End) :- begin('ev_2011_12_la_liga',_,_,Start), end('ev_2011_12_la_liga',_,_,End), Start=<End.

merlin_last_till_1_11(Start,End) :- merlin(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

merlin_until_ev_2011_12_la_liga_during_1_11_overlap(Start,End) :- merlin_last_till_1_11(Start1,End1), ev_2011_12_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

merlin_until_ev_2011_12_la_liga_during_1_11(Start,End) :- merlin(W1,_), merlin_until_ev_2011_12_la_liga_during_1_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-1), Start=<End.

merlin_until_ev_2011_12_la_liga_during_1_11_at_1996(Res) :- setof((Start,End),merlin_until_ev_2011_12_la_liga_during_1_11(Start,End),AllINtervals), checkvalidity(1996,AllINtervals,Res).

check_query() :- write('Query = merlin_until_ev_2011_12_la_liga_during_1_11_at_1996'), (merlin_until_ev_2011_12_la_liga_during_1_11_at_1996(true) -> write('\nRes   = true');write('\nRes   = false')).

