:- include('database.pl').
totally_spies_(Start,End) :- begin('totally_spies_',_,_,Start), end('totally_spies_',_,_,End), Start=<End.

ev_2010_11_premier_league(Start,End) :- begin('ev_2010_11_premier_league',_,_,Start), end('ev_2010_11_premier_league',_,_,End), Start=<End.

totally_spies__last_till_7_15(Start,End) :- totally_spies_(Start1,End1), (End1-Start1)>=7, Start is (Start1+7), End is (End1+1).

totally_spies__until_ev_2010_11_premier_league_during_7_15_overlap(Start,End) :- totally_spies__last_till_7_15(Start1,End1), ev_2010_11_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

totally_spies__until_ev_2010_11_premier_league_during_7_15(Start,End) :- totally_spies_(W1,_), totally_spies__until_ev_2010_11_premier_league_during_7_15_overlap(Start1,End1), Start is max((Start1-15),W1), End is (End1-7), Start=<End.

totally_spies__until_ev_2010_11_premier_league_during_7_15_at_1864(Res) :- setof((Start,End),totally_spies__until_ev_2010_11_premier_league_during_7_15(Start,End),AllINtervals), checkvalidity(1864,AllINtervals,Res).

check_query() :- write('Query = totally_spies__until_ev_2010_11_premier_league_during_7_15_at_1864'), (totally_spies__until_ev_2010_11_premier_league_during_7_15_at_1864(true) -> write('\nRes   = true');write('\nRes   = false')).

