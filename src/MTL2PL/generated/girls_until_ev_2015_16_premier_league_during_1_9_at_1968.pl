:- include('database.pl').
girls(Start,End) :- begin('girls',_,_,Start), end('girls',_,_,End), Start=<End.

ev_2015_16_premier_league(Start,End) :- begin('ev_2015_16_premier_league',_,_,Start), end('ev_2015_16_premier_league',_,_,End), Start=<End.

girls_last_till_1_9(Start,End) :- girls(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

girls_until_ev_2015_16_premier_league_during_1_9_overlap(Start,End) :- girls_last_till_1_9(Start1,End1), ev_2015_16_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

girls_until_ev_2015_16_premier_league_during_1_9(Start,End) :- girls(W1,_), girls_until_ev_2015_16_premier_league_during_1_9_overlap(Start1,End1), Start is max((Start1-9),W1), End is (End1-1), Start=<End.

girls_until_ev_2015_16_premier_league_during_1_9_at_1968(Res) :- setof((Start,End),girls_until_ev_2015_16_premier_league_during_1_9(Start,End),AllINtervals), checkvalidity(1968,AllINtervals,Res).

check_query() :- write('Query = girls_until_ev_2015_16_premier_league_during_1_9_at_1968'), (girls_until_ev_2015_16_premier_league_during_1_9_at_1968(true) -> write('\nRes   = true');write('\nRes   = false')).

