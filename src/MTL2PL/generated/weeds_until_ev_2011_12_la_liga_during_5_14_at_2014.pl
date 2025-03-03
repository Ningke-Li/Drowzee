:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

ev_2011_12_la_liga(Start,End) :- begin('ev_2011_12_la_liga',_,_,Start), end('ev_2011_12_la_liga',_,_,End), Start=<End.

weeds_last_till_5_14(Start,End) :- weeds(Start1,End1), (End1-Start1)>=5, Start is (Start1+5), End is (End1+1).

weeds_until_ev_2011_12_la_liga_during_5_14_overlap(Start,End) :- weeds_last_till_5_14(Start1,End1), ev_2011_12_la_liga(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

weeds_until_ev_2011_12_la_liga_during_5_14(Start,End) :- weeds(W1,_), weeds_until_ev_2011_12_la_liga_during_5_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-5), Start=<End.

weeds_until_ev_2011_12_la_liga_during_5_14_at_2014(Res) :- setof((Start,End),weeds_until_ev_2011_12_la_liga_during_5_14(Start,End),AllINtervals), checkvalidity(2014,AllINtervals,Res).

check_query() :- write('Query = weeds_until_ev_2011_12_la_liga_during_5_14_at_2014'), (weeds_until_ev_2011_12_la_liga_during_5_14_at_2014(true) -> write('\nRes   = true');write('\nRes   = false')).

