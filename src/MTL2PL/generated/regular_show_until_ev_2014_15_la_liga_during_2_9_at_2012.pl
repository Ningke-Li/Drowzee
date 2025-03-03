:- include('database.pl').
regular_show(Start,End) :- begin('regular_show',_,_,Start), end('regular_show',_,_,End), Start=<End.

ev_2014_15_la_liga(Start,End) :- begin('ev_2014_15_la_liga',_,_,Start), end('ev_2014_15_la_liga',_,_,End), Start=<End.

regular_show_last_till_2_9(Start,End) :- regular_show(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

regular_show_until_ev_2014_15_la_liga_during_2_9_overlap(Start,End) :- regular_show_last_till_2_9(Start1,End1), ev_2014_15_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

regular_show_until_ev_2014_15_la_liga_during_2_9(Start,End) :- regular_show(W1,_), regular_show_until_ev_2014_15_la_liga_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

regular_show_until_ev_2014_15_la_liga_during_2_9_at_2012(Res) :- setof((Start,End),regular_show_until_ev_2014_15_la_liga_during_2_9(Start,End),AllINtervals), checkvalidity(2012,AllINtervals,Res).

check_query() :- write('Query = regular_show_until_ev_2014_15_la_liga_during_2_9_at_2012'), (regular_show_until_ev_2014_15_la_liga_during_2_9_at_2012(true) -> write('\nRes   = true');write('\nRes   = false')).

