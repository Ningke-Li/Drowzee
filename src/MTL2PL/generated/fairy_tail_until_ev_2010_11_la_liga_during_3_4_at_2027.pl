:- include('database.pl').
fairy_tail(Start,End) :- begin('fairy_tail',_,_,Start), end('fairy_tail',_,_,End), Start=<End.

ev_2010_11_la_liga(Start,End) :- begin('ev_2010_11_la_liga',_,_,Start), end('ev_2010_11_la_liga',_,_,End), Start=<End.

fairy_tail_last_till_3_4(Start,End) :- fairy_tail(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

fairy_tail_until_ev_2010_11_la_liga_during_3_4_overlap(Start,End) :- fairy_tail_last_till_3_4(Start1,End1), ev_2010_11_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

fairy_tail_until_ev_2010_11_la_liga_during_3_4(Start,End) :- fairy_tail(W1,_), fairy_tail_until_ev_2010_11_la_liga_during_3_4_overlap(Start1,End1), Start is max((Start1-4),W1), End is (End1-3), Start=<End.

fairy_tail_until_ev_2010_11_la_liga_during_3_4_at_2027(Res) :- setof((Start,End),fairy_tail_until_ev_2010_11_la_liga_during_3_4(Start,End),AllINtervals), checkvalidity(2027,AllINtervals,Res).

check_query() :- write('Query = fairy_tail_until_ev_2010_11_la_liga_during_3_4_at_2027'), (fairy_tail_until_ev_2010_11_la_liga_during_3_4_at_2027(true) -> write('\nRes   = true');write('\nRes   = false')).

