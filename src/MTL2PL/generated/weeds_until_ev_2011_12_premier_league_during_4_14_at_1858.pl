:- include('database.pl').
weeds(Start,End) :- begin('weeds',_,_,Start), end('weeds',_,_,End), Start=<End.

ev_2011_12_premier_league(Start,End) :- begin('ev_2011_12_premier_league',_,_,Start), end('ev_2011_12_premier_league',_,_,End), Start=<End.

weeds_last_till_4_14(Start,End) :- weeds(Start1,End1), (End1-Start1)>=4, Start is (Start1+4), End is (End1+1).

weeds_until_ev_2011_12_premier_league_during_4_14_overlap(Start,End) :- weeds_last_till_4_14(Start1,End1), ev_2011_12_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

weeds_until_ev_2011_12_premier_league_during_4_14(Start,End) :- weeds(W1,_), weeds_until_ev_2011_12_premier_league_during_4_14_overlap(Start1,End1), Start is max((Start1-14),W1), End is (End1-4), Start=<End.

weeds_until_ev_2011_12_premier_league_during_4_14_at_1858(Res) :- setof((Start,End),weeds_until_ev_2011_12_premier_league_during_4_14(Start,End),AllINtervals), checkvalidity(1858,AllINtervals,Res).

check_query() :- write('Query = weeds_until_ev_2011_12_premier_league_during_4_14_at_1858'), (weeds_until_ev_2011_12_premier_league_during_4_14_at_1858(true) -> write('\nRes   = true');write('\nRes   = false')).

