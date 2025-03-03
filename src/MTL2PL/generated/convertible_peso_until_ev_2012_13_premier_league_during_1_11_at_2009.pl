:- include('database.pl').
convertible_peso(Start,End) :- begin('convertible_peso',_,_,Start), end('convertible_peso',_,_,End), Start=<End.

ev_2012_13_premier_league(Start,End) :- begin('ev_2012_13_premier_league',_,_,Start), end('ev_2012_13_premier_league',_,_,End), Start=<End.

convertible_peso_last_till_1_11(Start,End) :- convertible_peso(Start1,End1), (End1-Start1)>=1, Start is (Start1+1), End is (End1+1).

convertible_peso_until_ev_2012_13_premier_league_during_1_11_overlap(Start,End) :- convertible_peso_last_till_1_11(Start1,End1), ev_2012_13_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

convertible_peso_until_ev_2012_13_premier_league_during_1_11(Start,End) :- convertible_peso(W1,_), convertible_peso_until_ev_2012_13_premier_league_during_1_11_overlap(Start1,End1), Start is max((Start1-11),W1), End is (End1-1), Start=<End.

convertible_peso_until_ev_2012_13_premier_league_during_1_11_at_2009(Res) :- setof((Start,End),convertible_peso_until_ev_2012_13_premier_league_during_1_11(Start,End),AllINtervals), checkvalidity(2009,AllINtervals,Res).

check_query() :- write('Query = convertible_peso_until_ev_2012_13_premier_league_during_1_11_at_2009'), (convertible_peso_until_ev_2012_13_premier_league_during_1_11_at_2009(true) -> write('\nRes   = true');write('\nRes   = false')).

