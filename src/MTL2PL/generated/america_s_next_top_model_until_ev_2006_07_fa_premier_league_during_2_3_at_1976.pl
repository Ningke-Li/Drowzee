:- include('database.pl').
america_s_next_top_model(Start,End) :- begin('america_s_next_top_model',_,_,Start), end('america_s_next_top_model',_,_,End), Start=<End.

ev_2006_07_fa_premier_league(Start,End) :- begin('ev_2006_07_fa_premier_league',_,_,Start), end('ev_2006_07_fa_premier_league',_,_,End), Start=<End.

america_s_next_top_model_last_till_2_3(Start,End) :- america_s_next_top_model(Start1,End1), (End1-Start1)>=2, Start is (Start1+2), End is (End1+1).

america_s_next_top_model_until_ev_2006_07_fa_premier_league_during_2_3_overlap(Start,End) :- america_s_next_top_model_last_till_2_3(Start1,End1), ev_2006_07_fa_premier_league(Start2,End2), Start is max(Start1,Start2), End is min(End1,End2), Start<End.

america_s_next_top_model_until_ev_2006_07_fa_premier_league_during_2_3(Start,End) :- america_s_next_top_model(W1,_), america_s_next_top_model_until_ev_2006_07_fa_premier_league_during_2_3_overlap(Start1,End1), Start is max((Start1-3),W1), End is (End1-2), Start=<End.

america_s_next_top_model_until_ev_2006_07_fa_premier_league_during_2_3_at_1976(Res) :- setof((Start,End),america_s_next_top_model_until_ev_2006_07_fa_premier_league_during_2_3(Start,End),AllINtervals), checkvalidity(1976,AllINtervals,Res).

check_query() :- write('Query = america_s_next_top_model_until_ev_2006_07_fa_premier_league_during_2_3_at_1976'), (america_s_next_top_model_until_ev_2006_07_fa_premier_league_during_2_3_at_1976(true) -> write('\nRes   = true');write('\nRes   = false')).

