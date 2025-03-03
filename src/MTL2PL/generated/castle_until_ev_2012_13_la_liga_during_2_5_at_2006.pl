:- include('database.pl').
castle(Start,End) :- begin('castle',_,_,Start), end('castle',_,_,End), Start=<End.

ev_2012_13_la_liga(Start,End) :- begin('ev_2012_13_la_liga',_,_,Start), end('ev_2012_13_la_liga',_,_,End), Start=<End.

castle_last_till_2_5(Start,End) :- castle(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

castle_until_ev_2012_13_la_liga_during_2_5_overlap(Start,End) :- castle_last_till_2_5(Start1,End1), ev_2012_13_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

castle_until_ev_2012_13_la_liga_during_2_5(Start,End) :- castle(W1,_), castle_until_ev_2012_13_la_liga_during_2_5_overlap(Start1,End1), Start is max((Start1-5),W1), End is (End1-2), Start=<End.

castle_until_ev_2012_13_la_liga_during_2_5_at_2006(Res) :- setof((Start,End),castle_until_ev_2012_13_la_liga_during_2_5(Start,End),AllINtervals), checkvalidity(2006,AllINtervals,Res).

check_query() :- write('Query = castle_until_ev_2012_13_la_liga_during_2_5_at_2006'), (castle_until_ev_2012_13_la_liga_during_2_5_at_2006(true) -> write('\nRes   = true');write('\nRes   = false')).

