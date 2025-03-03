:- include('database.pl').
shameless(Start,End) :- begin('shameless',_,_,Start), end('shameless',_,_,End), Start=<End.

ev_2014_15_premier_league(Start,End) :- begin('ev_2014_15_premier_league',_,_,Start), end('ev_2014_15_premier_league',_,_,End), Start=<End.

shameless_last_till_2_9(Start,End) :- shameless(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

shameless_until_ev_2014_15_premier_league_during_2_9_overlap(Start,End) :- shameless_last_till_2_9(Start1,End1), ev_2014_15_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

shameless_until_ev_2014_15_premier_league_during_2_9(Start,End) :- shameless(W1,_), shameless_until_ev_2014_15_premier_league_during_2_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-2), Start=<End.

shameless_until_ev_2014_15_premier_league_during_2_9_at_2011(Res) :- setof((Start,End),shameless_until_ev_2014_15_premier_league_during_2_9(Start,End),AllINtervals), checkvalidity(2011,AllINtervals,Res).

check_query() :- write('Query = shameless_until_ev_2014_15_premier_league_during_2_9_at_2011'), (shameless_until_ev_2014_15_premier_league_during_2_9_at_2011(true) -> write('\nRes   = true');write('\nRes   = false')).

