:- include('database.pl').
psych(Start,End) :- begin('psych',_,_,Start), end('psych',_,_,End), Start=<End.

ev_2010_11_la_liga(Start,End) :- begin('ev_2010_11_la_liga',_,_,Start), end('ev_2010_11_la_liga',_,_,End), Start=<End.

psych_last_till_3_7(Start,End) :- psych(Start1,End1), (End1-Start1)>=3, Start is (Start1+3), End is (End1+1).

psych_until_ev_2010_11_la_liga_during_3_7_overlap(Start,End) :- psych_last_till_3_7(Start1,End1), ev_2010_11_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

psych_until_ev_2010_11_la_liga_during_3_7(Start,End) :- psych(W1,_), psych_until_ev_2010_11_la_liga_during_3_7_overlap(Start1,End1), Start is max((Start1-7),W1), End is (End1-3), Start=<End.

psych_until_ev_2010_11_la_liga_during_3_7_at_1859(Res) :- setof((Start,End),psych_until_ev_2010_11_la_liga_during_3_7(Start,End),AllINtervals), checkvalidity(1859,AllINtervals,Res).

check_query() :- write('Query = psych_until_ev_2010_11_la_liga_during_3_7_at_1859'), (psych_until_ev_2010_11_la_liga_during_3_7_at_1859(true) -> write('\nRes   = true');write('\nRes   = false')).

